package azure.naming

deny contains msg if {

    resource := input.resource_changes[_]

    resource.type == "azurerm_resource_group"

    not startswith(resource.change.after.name, "rg-")

    msg := sprintf(
        "Resource Group '%s' must start with rg-",
        [resource.change.after.name]
    )
}