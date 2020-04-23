resource "azurerm_public_ip" "jumpBoxPublicIP" {
  name                = "${var.suffix}${var.jumpBoxVMName}${var.publicIPName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  allocation_method   = var.publicIPAllocation

  tags = var.tags
}

resource "azurerm_network_interface" "jumpBoxNI" {
  name                = "${var.suffix}${var.jumpBoxVMName}${var.networkInterfaceName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  ip_configuration {
    name                          = "${var.suffix}${var.jumpBoxVMName}IPConf"
    subnet_id                     = data.azurerm_subnet.mainSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumpBoxPublicIP.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "jumpBoxSG" {
  network_interface_id      = azurerm_network_interface.jumpBoxNI.id
  network_security_group_id = azurerm_network_security_group.genericNSG.id
}

resource "azurerm_windows_virtual_machine" "jumpBoxVM" {
  name                = "${var.suffix}${var.jumpBoxVMName}"
  resource_group_name = azurerm_resource_group.genericRG.name
  location            = azurerm_resource_group.genericRG.location
  size                = var.jumpBoxVMSize
  admin_username      = var.vmUserName
  admin_password      = var.windowsPassword

  network_interface_ids = ["${azurerm_network_interface.jumpBoxNI.id}"]

  os_disk {
    name                 = "${var.suffix}${var.jumpBoxVMName}OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.vmSKU
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.genericSA.primary_blob_endpoint
  }

  tags = var.tags
}
