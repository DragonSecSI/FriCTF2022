variable "name" {
  description = "Challenge name"
  type = string
  nullable = false
}

variable "hostname" {
  description = "Ingress hostname"
  type = string
  nullable = false
}

variable "k8s_namespace" {
  description = "Kubernetes namespace"
  type = string
  default = "default"
}

variable "k8s_image" {
  description = "Kubernetes container image"
  type = string
  nullable = false
}

variable "k8s_image_bot" {
  description = "Kubernetes container bot image"
  type = string
  nullable = false
}

variable "k8s_registry_secret" {
  description = "Kubernetes "
  type = string
  nullable = false
  sensitive = true
}
