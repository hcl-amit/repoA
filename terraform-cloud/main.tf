resource "tfe_workspace" "workspace" {

  name         = var.workspace_name
  organization = var.organization
  execution_mode = "local"
}

resource "tfe_variable" "client_id" {

  key          = "AZURE_CLIENT_ID"
  value        = var.azure_client_id
  category     = "env"
  sensitive    = false
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "tenant_id" {

  key          = "AZURE_TENANT_ID"
  value        = var.azure_tenant_id
  category     = "env"
  sensitive    = false
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "subscription_id" {

  key          = "AZURE_SUBSCRIPTION_ID"
  value        = var.azure_subscription_id
  category     = "env"
  sensitive    = false
  workspace_id = tfe_workspace.workspace.id
}