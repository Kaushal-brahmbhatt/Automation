variable "linux_name" {
    type = string
	default = "n01605052-u-vm1"
}

variable "linux_size" {
    type = string
    default = "Standard_B1s"
}

variable "admin_username" {
    type = string
    default = "kaushal"
}

variable "pubkey" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}

variable "os_disk_storage_account_type" {
    type = string
    default = "Premium_LRS"
}

variable "os_disk_size" {
    type = number
    default = 32
}

variable "os_disk_caching" {
    type = string
    default = "ReadWrite"
}

variable "ubuntu_publisher" {
    type = string
    default = "Canonical"
}

variable "ubuntu_offer" {
    type = string
    default = "UbuntuServer"
}

variable "ubuntu_sku" {
    type = string
    default = "19.04"
}

variable "ubuntu_version" {
    type = string
    default = "latest"
}

