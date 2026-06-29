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