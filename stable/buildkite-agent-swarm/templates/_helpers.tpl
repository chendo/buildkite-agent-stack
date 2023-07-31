{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Set the Deployment API version based on the version of Kubernetes the chart is being deployed into.
*/}}
{{- define "deployment.apiVersion" -}}
{{- if semverCompare "<1.9-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Set the DaemonSet API version based on the version of Kubernetes the chart is being deployed into.
*/}}
{{- define "daemonset.apiVersion" -}}
{{- if semverCompare "<1.9-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Define Pdb apiVersion
*/}}
{{- define "pdb.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "policy/v1" }}
{{- printf "policy/v1" -}}
{{- else }}
{{- printf "policy/v1beta1" -}}
{{- end }}
{{- end }}

{{- define "dictToTags" -}}
{{- $first := true -}}
{{- range $key, $value := . -}}
{{- if $first -}}
{{- $first = false -}}
{{- else -}},
{{- end -}}
{{- printf "%s=%s" $key $value -}}
{{- end }}
{{- end }}
