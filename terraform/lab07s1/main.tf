variable "location" {
  type        = string
  description = "The location/region of the resource group"
  default     = "Canada Central"
}

module "resource_group" {
  source      = "./modules/resource_group"
  name-prefix = "lab"
  location    = var.location
}

module "network" {
  source   = "./modules/network"
  location = var.location
  rg       = module.resource_group.network-rg
}

module "linux_vm" {
  source    = "./modules/linux"
  location  = var.location
  rg        = module.resource_group.linux-rg
  subnet_id = module.network.subnet1-id
}

module "window_vm" {
  source    = "./modules/windows"
  location  = var.location
  rg        = module.resource_group.windows-rg
  subnet_id = module.network.subnet2-id
}