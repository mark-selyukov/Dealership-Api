{{/*
Common labels
*/}}
{{- define "dealership-api.labels" -}}
helm.sh/chart: {{ include "dealership-api.chart" . }}
{{ include "dealership-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dealership-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dealership-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}