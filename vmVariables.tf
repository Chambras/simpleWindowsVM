## Authentication
variable "vmUserName" {
  type        = string
  default     = "MZVAdmin"
  description = "Username to be added to the VM."
}

variable "windowsPassword" {
  type        = string
  default     = "DoNotStorePasswordsHere!!"
  description = "Windows password to use when creating the VM. It is not recommended to store these values here. Try using ENV variables. more documentation here https://www.terraform.io/docs/configuration/variables.html#variable-definition-precedence"
}

## Networking
variable "publicIPName" {
  type        = string
  default     = "PublicIP"
  description = "Default Public IP name."
}

variable "publicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "networkInterfaceName" {
  type        = string
  default     = "NIC"
  description = "Default Windows Network Interface Name."
}

# OS
variable "vmSKU" {
  type        = string
  default     = "2016-Datacenter"
  description = "Default VM SKU to be used in the VMS."
}

## Disk sizes
variable "DataDiskESize" {
  type        = number
  default     = 10
  description = "Data Disk E size."
}

### JumpBox
variable "jumpBoxVMName" {
  type        = string
  default     = "JumpBox"
  description = "Default JumpBox VM server name."
}

variable "jumpBoxVMSize" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "Default JumpBox VM size."
}
