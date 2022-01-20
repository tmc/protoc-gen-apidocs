{{/***************************************************************
Markdown template for protoc-gen-apidocs

This template is rendered once per incoming .proto file and 
defines the resulting output documentation.

This file is organized into blocks via the go template "define"
function and they are executed with the "template" function.
***************************************************************/}}

{{/***************************************************************
Main output block
***************************************************************/}}
{{define "output" -}}
# {{ .Desc.Path |base }}

<a name="{{.Desc.Path |base | anchor}}"></a><p align="right"><a href="#top">Top</a></p>

<!-- begin services -->
{{range .Services}}
{{template "service" .}}
{{end}}
<!-- begin services -->

{{ range .Messages }}
{{template "message" .}}
{{end}} <!-- end messages -->

<!-- begin file-level enums -->
{{range .Enums}}
{{template "enum" .}}
{{end}} <!-- end file-level enums -->

<!-- begin file-level extensions -->
{{if .Extensions}}
<a name="{{.Desc.Path |base | anchor}}-extensions"></a>

### File-level Extensions
| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
{{range .Extensions -}}
  | {{.Desc.Name}} | {{.Desc.FullName}} | {{.Parent | message_type}} | {{.Desc.Number}} | {{ .Comments.Leading | description | nobr}} {{ .Comments.Trailing | description | nobr}} |
{{end}}
{{end}} <!-- end file-level extensions -->

{{end}}


{{/***************************************************************
Service template
***************************************************************/}}
{{define "service"}}
<a name="{{.Desc.FullName | anchor}}"></a>

### {{.Desc.Name}}

{{.Comments.Leading | description}}
{{.Comments.Trailing | description}}

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
{{range .Methods -}}
  | {{.Desc.Name}} | [{{ .Input | message_type }}](#{{ .Input | full_message_type | anchor }}) | [{{ .Output | message_type }}](#{{ .Output | full_message_type | anchor }}){{if .Desc.IsStreamingServer}} stream{{end}} | {{ .Comments.Leading | description | nobr}} {{ .Comments.Trailing | description | nobr}} |
{{end}}
{{end}}



{{/***************************************************************
Message template
***************************************************************/}}
{{define "message"}}
<a name="{{.Desc.FullName | anchor}}"></a>

### {{.Desc.Name}}

{{.Comments.Leading | description}}
{{.Comments.Trailing | description}}

{{if .Fields}}
| Field | Type | Description |
| ----- | ---- | ----------- |
{{range .Fields}}{{template "field" .}}{{end}}
{{end}}

{{if .Extensions}}
| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
{{range .Extensions -}}
  | {{.Desc.Name}} | {{.Desc | long_name}} | {{.Parent | message_type}} | {{.Desc.Number}} | {{ .Comments.Leading | description | nobr}} {{ .Comments.Trailing | description | nobr}} |
{{end}}
{{end}}

{{ range .Messages }}
{{template "message" .}}
{{end}} <!-- end nested messages -->

{{range .Enums}}
{{template "enum" .}}
{{end}} <!-- end nested enums -->

{{end}}

{{/***************************************************************
Field template
***************************************************************/}}
{{define "field" -}}
  | {{.Desc.Name}} | 
{{- if (is_primitive .) -}}
  {{ field_type . }}
{{- else -}}
  [{{ .| field_type }}](#{{ full_field_type . | anchor }})
{{- end -}}
| {{ .Comments.Leading | description | nobr}} {{ .Comments.Trailing | description | nobr }} |
{{end}}


{{/***************************************************************
Enum template
***************************************************************/}}
{{define "enum" }}
<a name="{{.Desc.FullName | anchor}}"></a>

### {{.Desc | long_name}}
{{.Comments.Leading | description}}
{{.Comments.Trailing | description}}

| Name | Number | Description |
| ---- | ------ | ----------- |
{{range .Values -}}
  | {{.Desc.Name}} | {{.Desc.Number}} | {{ .Comments.Leading | description | nobr}} {{ .Comments.Trailing | description | nobr}} |
{{end}}
{{end}}