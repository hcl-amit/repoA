# Azure Virtual Network Module

## Features

- Creates Azure Virtual Network
- Supports custom DNS servers
- Supports tagging
- Terraform Test supported
- OPA Policy supported
- Terraform Cloud compatible

## Example

```hcl
module "vnet" {

  source = "../"

  name                = "vnet-demo"

  resource_group_name = "rg-demo"

  location = "Central India"

  address_space = [
    "10.10.0.0/16"
  ]

}
```