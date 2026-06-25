variable "tfe_token" {
sensitive = true
}

variable "workspace_name" {
  type = string
}
variable "organization" {
  type = string
}
variable "environment" {
  description = "Deployment environment"
  type        = string
}

