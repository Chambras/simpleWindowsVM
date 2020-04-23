# Simple Windows VM

It creates the following resources:

* A New Resource Group to host the VMs.
* A Windows VM.
* A Network Security Group (NSG) to secure RDP access to the Windows VM.
* A public IP to access the VM. This can be removed when deployed in an internal environment where Express Route and/or VPN are available.

> [!IMPORTANT]
> It assumes that a VNet,  subnet and a storage account are already created.
And you just provide those values in _`variables.tf`_. The variables to use are:
>
> * mainRGName - Main Resource Group Name where storage account, log analytics, etc are created.
> * vnetRGName - VNet RG where all the network resources are located.
> * mainSubnetName - Main subnet to use.
> * storageAccountName - Storage Account where to store VM logs.

## Project Structure

This project has the following files which make them easy to reuse, add or remove.

```ssh
.
├── LICENSE
├── README.md
├── jumpBox.tf
├── main.tf
├── networking.tf
├── outputs.tf
├── security.tf
├── storage.tf
├── variables.tf
└── vmVariables.tf
```

Most common parameters are exposed as variables in _`variables.tf`_ and in _`vmVariables.tf`_

## Pre-requisites

It is assumed that you have azure CLI and Terraform installed and configured.
More information on this topic [here](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure). I recommend using a Service Principal with a certificate.

### versions

This terraform script has been tested using the following versions:

* Terraform =>0.12.24
* Azure provider 2.4.0
* Azure CLI 2.4.0

## VM Authentication

Windows authentication uses user name and password. It is not recommended setting these values in terraform scripts. You can set them as Environment variables. More information about this approach can be found [here](https://www.terraform.io/docs/configuration/variables.html#environment-variables).
These are the recommended variables that you should set up using this approach:

```ssh
export TF_VAR_vmUserName={{VMUSER}}
export TF_VAR_windowsPassword={{VMPASSWORD}}
```

## Usage

Just run these commands to initialize terraform, get a plan and approve it to apply it.

```ssh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

I also recommend using a remote state instead of a local one. You can change this configuration in _`main.tf`_
You can create a free Terraform Cloud account [here](https://app.terraform.io).

## Clean resources

It will destroy everything that was created.

```ssh
terraform destroy --force
```

## Caution

Be aware that by running this script your account might get billed.

## Authors

* Marcelo Zambrana
