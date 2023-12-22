
# https://registry.terraform.io/modules/terraform-aviatrix-modules/mc-transit/aviatrix/latest

# Step1 - deploy transit
module "mc-transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.5.1"
  cloud = "Azure"        
  cidr = var.cidr
  region = var.region
  account = var.account
  # resource_group = var.rg   # rm for use in GH sourced module
  local_as_number = var.localasn
  insane_mode = "true"
  name = "aztransit112-weu"
  enable_advertise_transit_cidr = "true"
  bgp_lan_interfaces_count = "1"
  enable_segmentation    = "true"
  tags  =  var.tags
}




