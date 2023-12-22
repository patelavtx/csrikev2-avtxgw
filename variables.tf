variable "csr_rg_name" {
  description = "Provide CSR resource group name"
  default = "atulrg-csrike2"
}

variable "csr_rg_location" {
    description = "Provide location of CSR resource group"
    default = "West Europe"
}

variable "csr_name" {
    description = "Provide CSR Name"
    default = "csr-ikev2"
}

variable "csr_vnet_address_space" {
  description = "Provide CSR vNet address space"
  default = "10.204.32.0/24"
}

variable "csr_public_subnet_address_space" {
  description = "Provide CSR vNet address space"
  default = "10.204.32.0/25"
}

variable "csr_private_subnet_address_space" {
  description = "Provide CSR vNet address space"
  default = "10.204.32.128/25"
}

variable "csr_asn" {
  description = "CSR ASN number, cannot be 65515"
  default = 65204
}

variable "admin_username" {
  description = "Provide CSR admin user name"
  default = "azureuser"
}

variable "admin_password" {
  description = "Provide CSR admin password"
  default = "Aviatrix123#"
}

variable "ipsec_psk" {
  description = "Provide IPSec Pre-shared key"
  default = "Aviatrix123#"
}




# Removed as not needed when using module.  Uncomment if cloned and using locally, also then needs provider.tf
/*
# avtx-tx vars;  omit for module based runs

variable "controller_ip" {
  description = "Set controller ip"
  type        = string
}

variable "ctrl_password" {
    type = string
}
*/


variable "account" {
    type = string
}

variable "cloud" {
  description = "Cloud type"
  type        = string

  validation {
    condition     = contains(["aws", "azure", "oci", "ali", "gcp"], lower(var.cloud))
    error_message = "Invalid cloud type. Choose AWS, Azure, GCP, ALI or OCI."
  }
}

variable "cidr" {
  description = "Set vpc cidr"
  type        = string
}
/*
variable "instance_size" {
  description = "Set vpc cidr"
  type        = string
}
*/
variable "region" {
  description = "Set regions"
  type        = string
  default = "West Europe"
}

# specify existing RG
variable "rg" {
  description = "Set RG"
  type        = string
  default = "atulrg-tx112"
}

variable "localasn" {
  description = "Set internal BGP ASN"
  type        = string
}

variable "bgp_advertise_cidrs" {
  description = "Define a list of CIDRs that should be advertised via BGP."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to assign to the gateway."
  type        = map(string)
  default     = null
}


# s2c stuff

#  azure vng is limited to 169.254.21.x <> 169.254.22.x,  not sure on avtx, but using same standard
variable "apipa1" {
  description = "Provide CSR vNet address space"
  default = "169.254.21.204/30"
}


variable "apipa2" {
  description = "Provide CSR vNet address space"
  default = "169.254.22.204/30"
}


locals {
  avtxapipa1 = cidrhost(var.apipa1,1)
  avtxapipa2 = cidrhost(var.apipa2,1)
  csrapipa1 = cidrhost(var.apipa1,2)
  csrapipa2 = cidrhost(var.apipa2,2)
  phase1_remote_identifier = azurerm_public_ip.csr_pip.ip_address   # ikev2 works with pip
}