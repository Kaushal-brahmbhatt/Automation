variable "rg" {
  type = string
  default = "network-rg"
}

variable "location" {
  type = string
  default = "Canada Central"
}

variable "network_vnet" {
  type = string
  default = "network-vnet"
}

variable "network_vnet_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "network_subnet1" {
  type = string
  default = "network_subnet1"
}

variable "network_subnet2" {
  type = string
  default = "network_subnet2"
}

variable "network_subnet1_address_space" {
  type = list(string)
  default = ["10.0.0.0/24"]
}

variable "netwwork_subnet2_address_space" {
  type = list(string)
  default = ["10.0.1.0/24"]
}

variable "network_nsg1" {
  type = string
  default = "network-nsg1"
}

variable "network_nsg2" {
  type = string
  default = "network-nsg2"
}