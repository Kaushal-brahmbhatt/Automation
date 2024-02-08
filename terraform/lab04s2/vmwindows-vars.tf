variable "windows_username" {
    type = string
    default = "n01605052kaushal"
}

variable "windows_password" {
    type = string
    default = "N01605052@Winuser"
}

variable "windows_os_disk_storage_account_type" {
    type = string
    default = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
    type = number
    default = 32
}

variable "windows_os_disk_caching" {
    type = string
    default = "ReadWrite"
}

variable "windows_os_publisher" {
    type = string
    default = "MicrosoftWindowsServer"
}

variable "windows_os_offer" {
    type = string
    default = "WindowsServer"
}

variable "windows_os_sku" {
    type = string
    default = "2016-Datacenter"
}

variable "windows_os_version" {
    type = string
    default = "latest"
}

variable "windows_avs" {
    type = string
    default = "windows-avs"
}

variable "windows_name" {
    type = map(string)
    default = {
        "n01605052-w-vm1" = "Standard_B1s"
        "n01605052-w-vm2" = "Standard_B1ms"
    }
}