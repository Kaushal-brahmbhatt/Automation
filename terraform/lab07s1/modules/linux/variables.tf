variable "rg" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The location/region of the resource group"
}

variable "vm-name-prefix" {
  type        = string
  description = "The name prefix of the virtual machine"
  default     = "n01605052-l"
}

variable "nic-prefix" {
  type        = string
  description = "The name prefix of the network interface"
  default     = "lab-network-nic"
}

variable "vm_count" {
  type        = number
  description = "The number of virtual machines to create"
  default     = 2
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}


locals {
  tags = {
    Name         = "Terrafom-Class"
    Project      = "Learning"
    ContactEmail = "n01605052@humber.ca"
    Environment  = "Lab"
  }
}
