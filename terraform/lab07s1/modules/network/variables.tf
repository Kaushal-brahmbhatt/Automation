
variable "network_name_prefix" {
  type        = string
  description = "The name prefix of the network"
  default     = "lab"
}

variable "network_address_space" {
  type        = list(string)
  description = "The address space of the network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name_prefix" {
  type        = string
  description = "The name prefix of the subnet"
  default     = "lab-network-subnet"
}

variable "security_group_name_prefix" {
  type        = string
  description = "The name prefix of the security group"
  default     = "lab-network-security-group"
}

variable "rg" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}