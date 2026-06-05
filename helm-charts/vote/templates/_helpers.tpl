{{- define "vote.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "vote.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "vote.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "vote.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vote.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
