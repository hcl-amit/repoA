resource "tfe_workspace" "workspace" {
  name = "statefile-${var.environment}"
  organization = "HCLIT"
}
