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
Immutable selector — must stay stable across Helm upgrades (Deployment.spec.selector cannot change).
Keep only the legacy key used by the first revision of this chart.
*/}}
{{- define "interview-app.matchLabels" -}}
app: interviewapp
{{- end }}

{{/*
Pod (and Service) routing labels — extra keys live here only on the pod template, not in Deployment.selector.
*/}}
{{- define "interview-app.podLabels" -}}
{{ include "interview-app.matchLabels" . }}
app.kubernetes.io/name: {{ include "interview-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels on all resources (metadata only).
*/}}
{{- define "interview-app.labels" -}}
helm.sh/chart: {{ include "interview-app.chart" . }}
{{ include "interview-app.podLabels" . }}
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
