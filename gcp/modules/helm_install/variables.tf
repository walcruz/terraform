variable "helm_name" {
  description = "Helm resource Name"
  type        = string
}

variable "helm_repository" {
  description = "Helm Repository"
  type        = string
}

variable "helm_chart" {
  description = "Helm chart Name"
  type        = string
}

variable "helm_version" {
  description = "Helm Version"
  type        = string
}

variable "helm_namespace" {
  description = "Kubernets namespace"
  type        = string
}

variable "helm_values" {
  description = "Helm values file path"
  type        = string
}
