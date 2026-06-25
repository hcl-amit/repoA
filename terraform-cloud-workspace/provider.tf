provider "tfe" {
  token = var.tfe_token != "" ? var.tfe_token : null
}
