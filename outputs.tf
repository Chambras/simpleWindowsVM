output "generic_RG" {
  description = "Resource Group Name."
  value       = azurerm_resource_group.genericRG.name
}

output "vNetName" {
  description = "VNet Name."
  value       = var.vnetName
}

output "mainSubnet" {
  description = "Main Subnet Name."
  value       = var.mainSubnetName
}

output "jumpBoxPublicIP" {
  description = "JumpBox public IP."
  value       = azurerm_public_ip.jumpBoxPublicIP.ip_address
}

output "jumpBoxPrivateIP" {
  description = "JumpBox private IP."
  value       = azurerm_network_interface.jumpBoxNI.private_ip_address
}
