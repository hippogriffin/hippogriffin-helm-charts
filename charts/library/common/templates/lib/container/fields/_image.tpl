{{/*
Image used by the container.
*/}}
{{- define "bjw-s.common.lib.container.field.image" -}}
  {{- $ctx := .ctx -}}
  {{- $rootContext := $ctx.rootContext -}}
  {{- $containerObject := $ctx.containerObject -}}

  {{- $imageRepo := $containerObject.image.repository -}}
  {{- $imageTag := $containerObject.image.tag -}}
  {{- $imageDigest := $containerObject.image.digest -}}

  {{- if and $imageRepo $imageTag -}}
    {{- if $imageDigest -}}
      {{- printf "%s:%s@%s" $imageRepo $imageTag $imageDigest -}}
    {{- else -}}
      {{- printf "%s:%s" $imageRepo $imageTag -}}
    {{- end -}}
  {{- else if and $imageRepo $imageDigest }}
      {{- printf "%s@%s" $imageRepo $imageDigest -}}
  {{- end -}}
{{- end -}}
