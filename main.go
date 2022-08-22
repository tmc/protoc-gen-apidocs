package main

import (
	"embed"
	"flag"
	"fmt"
	htmltemplate "html/template"
	"io/fs"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"text/template"

	"github.com/Masterminds/sprig"
	"google.golang.org/protobuf/compiler/protogen"
	"google.golang.org/protobuf/reflect/protoreflect"
)

func main() {
	var flags flag.FlagSet
	format := flags.String("format", "markdown", "Format to use")
	templates := flags.String("templates", "", "Custom templates directory to use")
	trimPrefix := flags.String("trimprefix", "", "If supplied, this prefix will be removed from generated file paths.")

	opts := &protogen.Options{
		ParamFunc: flags.Set,
	}
	opts.Run(func(gen *protogen.Plugin) error {
		genOpts := GenOpts{
			Format:      *format,
			TemplateDir: *templates,
			TrimPrefix:  *trimPrefix,
		}
		for _, f := range gen.Files {
			if !f.Generate {
				continue
			}
			if err := genOpts.generateFile(gen, f); err != nil {
				return err
			}
		}
		return nil
	})
}

// GenOpts hold options for generation.
type GenOpts struct {
	Format      string
	TemplateDir string
	TrimPrefix  string
}

var formatFileSuffixes = map[string]string{
	"markdown":      "md",
	"hugo-markdown": "md",
}

// generateFile generates a _ascii.pb.go file containing gRPC service definitions.
func (o *GenOpts) generateFile(gen *protogen.Plugin, file *protogen.File) error {
	suffix, ok := formatFileSuffixes[o.Format]
	if !ok {
		suffix = o.Format
	}
	filename := file.GeneratedFilenamePrefix + "." + suffix
	filename = strings.TrimPrefix(filename, o.TrimPrefix)
	g := gen.NewGeneratedFile(filename, file.GoImportPath)
	if err := o.renderTemplate(file, g); err != nil {
		return fmt.Errorf("issue generating %v: %w", filename, err)
	}
	return nil
}

func (o *GenOpts) relPath(t1, t2 protoreflect.Descriptor) string {
	path := ""
	cpf := filepath.Base(fmt.Sprint(t1.ParentFile().Path()))
	rpf := filepath.Base(fmt.Sprint(t2.ParentFile().Path()))
	if cpf != rpf {
		path, _ = filepath.Rel(cpf, rpf)
		path = strings.TrimSuffix(path, filepath.Ext(path))
		path = strings.TrimPrefix(path, ".")
		path = fmt.Sprintf("%s.%s", path, formatFileSuffixes[o.Format])
	}
	return path
}

func longName(d protoreflect.Descriptor) string {
	p := d.Parent()
	if p != nil && p.Parent() != nil {
		return fmt.Sprintf("%v.%v", p.Name(), d.Name())
	}
	return fmt.Sprint(d.Name())
}

func anchor(str interface{}) string {
	return specialCharsPattern.ReplaceAllString(strings.ReplaceAll(fmt.Sprint(str), "/", "_"), "-")
}

func (o *GenOpts) templateFuncMap() template.FuncMap {
	return map[string]interface{}{
		"anchor":    anchor,
		"long_name": longName,
		"field_type": func(f *protogen.Field) string {
			if f.Message != nil {
				return longName(f.Message.Desc)
			}
			if f.Enum != nil {
				return longName(f.Enum.Desc)
			}
			return fmt.Sprint(f.Desc.Kind())
		},
		"full_field_type": func(f *protogen.Field) string {
			if f.Message != nil {
				return fmt.Sprint(f.Message.Desc.FullName())
			}
			if f.Enum != nil {
				return fmt.Sprint(f.Enum.Desc.FullName())
			}
			return fmt.Sprint(f.Desc.Kind())
		},
		"is_primitive": func(f *protogen.Field) bool {
			// TODO: consider oneof, enum, ...
			k := f.Desc.Kind()
			nonPrim := k == protoreflect.EnumKind || k == protoreflect.MessageKind || k == protoreflect.GroupKind
			return !nonPrim
		},
		"message_type": func(f *protogen.Message) string {
			if f == nil {
				return "(none)"
			}
			return fmt.Sprint(f.Desc.Name())
		},
		"full_message_type": func(f *protogen.Message) string {
			return fmt.Sprint(f.Desc.FullName())
		},
		"is_google_type": func(f *protogen.Field) bool {
			if f.Message != nil {
				return strings.HasPrefix(string(f.Message.Desc.FullName()), "google.")
			}
			if f.Enum != nil {
				return strings.HasPrefix(string(f.Enum.Desc.FullName()), "google.")
			}
			return false
		},
		"type_link": func(f *protogen.Field) string {
			var t1, t2 protoreflect.Descriptor
			t1 = f.Desc
			if f.Message != nil {
				t2 = f.Message.Desc
			}
			if f.Enum != nil {
				t2 = f.Enum.Desc
			}
			if strings.HasPrefix(string(t2.FullName()), "google.") {
				return string(t2.FullName())
			}
			fn := o.relPath(t1, t2)
			typ := anchor(fmt.Sprint(t2.FullName()))
			return fmt.Sprintf(`%s#%s`, fn, typ)
		},
		"hugo_type_link": func(f *protogen.Field) string {
			// exclude google types:

			if f.Message != nil {
				if strings.HasPrefix(string(f.Message.Desc.FullName()), "google.") {
					return string(f.Message.Desc.FullName())
				}
				fn := fmt.Sprint(f.Message.Desc.ParentFile().Path())
				fn = filepath.Base(fn)
				fn = strings.TrimSuffix(fn, filepath.Ext(fn))
				typ := anchor(fmt.Sprint(f.Message.Desc.FullName()))
				return fmt.Sprintf(`{{< relref "%s#%s" >}}`, fn, typ)
			}
			if f.Enum != nil {
				fn := fmt.Sprint(f.Enum.Desc.ParentFile().Path())
				fn = filepath.Base(fn)
				fn = strings.TrimSuffix(fn, filepath.Ext(fn))
				typ := anchor(fmt.Sprint(f.Enum.Desc.FullName()))
				return fmt.Sprintf(`{{< relref "%s#%s" >}}`, fn, typ)
			}
			return fmt.Sprintf(`#%s`, anchor(f.Desc.FullName()))
		},
		"description": func(s interface{}) string {
			val := strings.TrimLeft(fmt.Sprint(s), "*/\n ")
			if strings.HasPrefix(val, "@exclude") {
				return ""
			}
			commentRe := regexp.MustCompile("\n// ?")
			return commentRe.ReplaceAllString(val, "\n")
		},
		"p":    pFilter,
		"para": paraFilter,
		"nobr": nobrFilter,
	}
}

//go:embed templates/*
var defaultTemplates embed.FS

func (o *GenOpts) getTemplateFS() (fs.FS, error) {
	if o.TemplateDir == "" {
		return fs.Sub(defaultTemplates, "templates")
	}
	tFS := os.DirFS(o.TemplateDir)
	return fs.Sub(tFS, o.TemplateDir)
}

func (o *GenOpts) renderTemplate(file *protogen.File, g *protogen.GeneratedFile) error {
	tFS, err := o.getTemplateFS()
	if err != nil {
		return err
	}
	t := template.New("file.tmpl").Funcs(o.templateFuncMap()).Funcs(sprig.TxtFuncMap())
	t, err = t.ParseFS(tFS, fmt.Sprintf("%v.tmpl", o.Format))
	if err != nil {
		return err
	}
	return t.ExecuteTemplate(g, "output", file)
}

// Template Helpers

var (
	paraPattern         = regexp.MustCompile(`(\n|\r|\r\n)\s*`)
	spacePattern        = regexp.MustCompile("( )+")
	multiNewlinePattern = regexp.MustCompile(`(\r\n|\r|\n){2,}`)
	specialCharsPattern = regexp.MustCompile(`[^a-zA-Z0-9_-]`)
)

func pFilter(content string) htmltemplate.HTML {
	paragraphs := paraPattern.Split(content, -1)
	return htmltemplate.HTML(fmt.Sprintf("<p>%s</p>", strings.Join(paragraphs, "</p><p>")))
}

func paraFilter(content string) string {
	paragraphs := paraPattern.Split(content, -1)
	return fmt.Sprintf("<para>%s</para>", strings.Join(paragraphs, "</para><para>"))
}

func nobrFilter(content string) string {
	normalized := strings.Replace(content, "\r\n", "\n", -1)
	paragraphs := multiNewlinePattern.Split(normalized, -1)
	for i, p := range paragraphs {
		withoutCR := strings.Replace(p, "\r", " ", -1)
		withoutLF := strings.Replace(withoutCR, "\n", " ", -1)
		paragraphs[i] = spacePattern.ReplaceAllString(withoutLF, " ")
	}
	return strings.Join(paragraphs, "\n\n")
}
