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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dealership-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "dealership-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create migration helpers
*/}}

{{/*
Build the image for the chart.
*/}}
{{- define "migrations.image" -}}
{{- if .Values.image.sha }}
{{- .Values.image.repository }}@{{ .Values.image.sha }}
{{- else if .Values.image.tag }}
{{- .Values.image.repository }}:{{ .Values.image.tag }}
{{- else }}
{{- .Values.image.repository }}
{{- end }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "migrations.name" -}}
{{- default .Values.migration | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "migrations.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.migration .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "migrations.chart" -}}
{{- printf "%s-%s" .Values.migration .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "migrations.labels" -}}
{{ include "migrations.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "migrations.selectorLabels" -}}
app.kubernetes.io/name: {{ include "migrations.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "migrations.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "migrations.fullname" .) .Values.migration }}
{{- else }}
{{- default "default" .Values.migration }}
{{- end }}
{{- end }}
