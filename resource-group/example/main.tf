module "resource_group" {

  source = "../"

  name     = "rg-demo-dev"
  location = "Central India"

  tags = {
    Environment = "dev"
    Owner       = "Terraform"
  }

}