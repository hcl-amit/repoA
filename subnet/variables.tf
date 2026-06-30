variable "name" {
  description = "The name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which to attach the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
  validation {
    condition     = alltrue([for prefix in var.address_prefixes : can(regex("^((25[0-4]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-4]|2[0-4][0-9]|[01]?[0-9][0-9]?)/([8-9]|1[0-9]|2[0-9]|3[0-2])$", prefix))])
    error_message = "Each address prefix must be in CIDR notation with valid IP ranges (0-254) and subnet mask (8-32) (e.g., 10.0.1.0/24)."
  }
}

variable "default_outbound_access_enabled" {
  description = "Enable default outbound access to the internet for the subnet."
  type        = bool
  default     = true
}

variable "private_endpoint_network_policies" {
  description = "Enable or Disable network policies for the private endpoint on the subnet."
  type        = string
  default     = "Disabled"
  validation {
    condition     = contains(["Disabled", "Enabled", "NetworkSecurityGroupEnabled", "RouteTableEnabled"], var.private_endpoint_network_policies)
    error_message = "private_endpoint_network_policies must be one of 'Disabled', 'Enabled', 'NetworkSecurityGroupEnabled', or 'RouteTableEnabled'."
  }
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or Disable network policies for the private link service on the subnet."
  type        = bool
  default     = true
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "delegations" {
  description = "A list of delegation blocks."
  type = list(object({
    delegation_name = string
    service_delegation = object({
      service_delegation_name = string
      actions                 = list(string)
    })
  }))
  default = []
}