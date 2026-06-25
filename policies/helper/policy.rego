package azure.vnets

import future.keywords.in

deny contains {"id": "VNET-001", "msg": msg} if {
    some resource in input.resource_changes
    resource.type == "azurerm_virtual_network"
    resource.change.actions[_] != "delete"

    resource.change.after.public_network_access_enabled == true

    msg := sprintf("Compliance Violation: Public network access must be Disabled on VNet: '%v'.", [resource.address])
}

deny contains {"id": "VNET-002", "msg": msg} if {
    some resource in input.resource_changes
    resource.type == "azurerm_virtual_network"
    resource.change.actions[_] != "delete"

    resource.change.after.vnet_encryption_enforcement != "DropUnencrypted"

    msg := sprintf("Compliance Violation: VNet Encryption Enforcement must be set to 'DropUnencrypted' on VNet: '%v'.", [resource.address])
}

passed_checks contains {"id": "VNET-PASS", "msg": msg} if {
    some resource in input.resource_changes
    resource.type == "azurerm_virtual_network"
    resource.change.actions[_] != "delete"

    resource.change.after.public_network_access_enabled == false
    resource.change.after.vnet_encryption_enforcement == "DropUnencrypted"

    msg := sprintf("Security Verified: VNet '%v' complies with all corporate infrastructure perimeter rules.", [resource.address])
}
