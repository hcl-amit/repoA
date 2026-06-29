variable "tfe_token" {

  type      = string
  sensitive = true

}

variable "organization" {

  type = string

}

variable "workspace_name" {

  type = string

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

resource "tfe_variable" "client_id" {

  key          = "ARM_CLIENT_ID"

  value        = var.azure_client_id

  category     = "env"

  workspace_id = tfe_workspace.workspace.id

}

resource "tfe_variable" "tenant_id" {

  key          = "ARM_TENANT_ID"

  value        = var.azure_tenant_id

  category     = "env"

  workspace_id = tfe_workspace.workspace.id

}

resource "tfe_variable" "subscription_id" {

  key          = "ARM_SUBSCRIPTION_ID"

  value        = var.azure_subscription_id

  category     = "env"

  workspace_id = tfe_workspace.workspace.id

}