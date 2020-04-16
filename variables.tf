variable "location" {
  type        = string
  default     = "eastus2"
  description = "Location where the resoruces are going to be created."
}

variable "suffix" {
  type        = string
  default     = "MZV"
  description = "To be added at the beginning of each resource."
}

variable "mainRGName" {
  type        = string
  default     = "MZVDemoRG"
  description = "Main Resource Group Name where storage account, log analytics, etc."
}

variable "vnetRGName" {
  type        = string
  default     = "MZV-Network"
  description = "VNet RG where all the network resources are located."
}

variable "vmRGName" {
  type        = string
  default     = "VMs"
  description = "RG where all the VMs are going to be created."
}

variable "saName" {
  type        = string
  default     = "mzvtestenv"
  description = "Main Storage Account."
}

variable "tags" {
  type = map
  default = {
    "Environment" = "Dev"
    "Project"     = "PoC"
    "BillingCode" = "Internal"
    "Customer"    = "Demo"
  }
}
## Network variables
variable "vnetName" {
  type        = string
  default     = "MZV-Main"
  description = "VNet name to use."
}

variable "mainSubnetName" {
  type        = string
  default     = "mzv-main-sas"
  description = "Main subnet to use."
}

## Security variables
variable "sgName" {
  type        = string
  default     = "default_RDPSSH_SG"
  description = "Default Security Group Name to be applied by default to VMs and subnets."
}

variable "sourceIPs" {
  type        = list
  default     = [""]
  description = "Public IPs to allow inboud communications."
}

## Storage
variable "storageAccountName" {
  type        = string
  default     = "mzvtestenv"
  description = "Storage Account."
}
