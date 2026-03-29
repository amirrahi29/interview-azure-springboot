{{/*
Expand the chart name.
*/}}
{{- define "interview-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Full name: release + chart (truncated). Use fullnameOverride for a fixed app name.
*/}}
{{- define "interview-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart label for tooling (Argo, monitoring).
*/}}
{{- define "interview-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels — must match between Deployment template and Service.
*/}}
{{- define "interview-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "interview-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: interviewapp
{{- end }}

{{/*
Common labels on all resources.
*/}}
{{- define "interview-app.labels" -}}
helm.sh/chart: {{ include "interview-app.chart" . }}
{{ include "interview-app.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
environment: {{ .Values.env | quote }}
tier: {{ .Values.environment.tier | quote }}
{{- end }}

{{/*
Deployment resource name (stable per release; namespace isolates envs).
*/}}
{{- define "interview-app.deploymentName" -}}
{{- .Values.deployment.name | default "interviewapp-deployment" }}
{{- end }}

{{/*
Service name referenced by Ingress.
*/}}
{{- define "interview-app.serviceName" -}}
{{- .Values.service.name | default "interview-app-service" }}
{{- end }}
