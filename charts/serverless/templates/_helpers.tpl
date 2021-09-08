{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "serverless.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "serverless.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "serverless.labels" -}}
app: {{ include "serverless.name" . }}
app.kubernetes.io/component: {{ include "serverless.name" . }}
app.kubernetes.io/instance: {{ include "serverless.name" . }}
app.kubernetes.io/name: {{ include "serverless.name" . }}
app.kubernetes.io/part-of: {{ default .Chart.Name .Values.partOf }}
app.openshift.io/runtime: {{ .Values.runtime.name }}
app.openshift.io/runtime-version: {{ .Values.runtime.version | quote }}
helm.sh/chart: {{ include "serverless.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Values.teamName }}
{{- end }}
