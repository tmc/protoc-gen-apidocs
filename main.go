package main

import (
	"flag"
	"fmt"
	"path/filepath"
	"strings"
	"text/template"

	"google.golang.org/protobuf/compiler/protogen"
)

func main() {
	var flags flag.FlagSet
	format := flags.String("format", "md", "Format to use")
	templates := flags.String("templates", "", "Custom templates directory to use")

	opts := &protogen.Options{
		ParamFunc: flags.Set,
	}
	opts.Run(func(gen *protogen.Plugin) error {
		genOpts := GenOpts{
			Format:      *format,
			TemplateDir: *templates,
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
}

// generateFile generates a _ascii.pb.go file containing gRPC service definitions.
func (o *GenOpts) generateFile(gen *protogen.Plugin, file *protogen.File) error {
	outName, err := o.getOutputFilename(file)
	if err != nil {
		return err
	}
	filename := outName + "." + o.Format
	g := gen.NewGeneratedFile(filename, file.GoImportPath)
	if err := o.renderTemplate(file, g); err != nil {
		return fmt.Errorf("issue generating %v: %w", filename, err)
	}
	return nil
}

func (o *GenOpts) renderTemplate(file *protogen.File, g *protogen.GeneratedFile) error {
	t := template.Must(template.New("file.tpl").ParseFiles("file.tpl"))
	return t.Execute(g, file)
}

func (o *GenOpts) getOutputFilename(file *protogen.File) (string, error) {
	// TODO: check if we're overwriting a previously generated name, further, consider an option to control this output more.
	result := filepath.Base(file.Proto.GetName())
	return strings.TrimSuffix(result, filepath.Ext(result)), nil
}
