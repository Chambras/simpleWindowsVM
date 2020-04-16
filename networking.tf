## Use existig network
data "azurerm_subnet" "mainSubnet" {
  name                 = var.mainSubnetName
  virtual_network_name = var.vnetName
  resource_group_name  = var.vnetRGName
}
