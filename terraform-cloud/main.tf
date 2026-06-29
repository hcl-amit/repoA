resource "tfe_workspace" "workspace" {

  name         = var.workspace_name

  organization = var.organization

  execution_mode = "remote"

  auto_apply = false

}

resource "tfe_variable" "oidc" {

  key          = "ARM_USE_OIDC"

  value        = "true"

  category     = "env"

  workspace_id = tfe_workspace.workspace.id

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