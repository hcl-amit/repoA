variable "resource_group_location" {
  type        = string
  description = "Enter location for Resource Group deployment"
}

variable "resource_group_tags" {
  type        = map(string)
  default     = {}
  description = "Enter tags for the resource group"
}
variable "resource_group_name" {
  type        = string
  description = "Enter the name for resource group"
}