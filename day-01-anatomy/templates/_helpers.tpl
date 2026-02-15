{{/*
Expand the name of the chart.
This is a standard helper you'll see in every real chart.
*/}}
{{- define "anatomy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
We define a block called "anatomy.labels" that prints 3 lines of YAML.
*/}}
{{- define "anatomy.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "anatomy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
