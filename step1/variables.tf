variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
  sensitive = true
}

variable "zone" {
  type = string
  default = "fr-par-1"
}

variable "region" {
  type = string
  default = "fr-par"
}

variable "project_id" {
  type = string
}
