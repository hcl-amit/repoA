variable "organization" {
  description = " Organization name in Terraform Cloud"
  type        = string
  default     = "UL-ULSE"
}

variable "workspace_name" {
  type = string
}
variable "tfe_token" {
  type      = string
  sensitive = true
}

variable "azure_client_id" {
  type      = string
  sensitive = true
}

variable "azure_tenant_id" {
  type      = string
  sensitive = true
}

variable "azure_subscription_id" {
  type      = string
  sensitive = true
}