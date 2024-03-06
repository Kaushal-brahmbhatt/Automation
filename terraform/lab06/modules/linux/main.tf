resource "azurerm_public_ip" "linux-ip" {
  name                = "${var.vm-name-prefix}-${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vm-name-prefix}-${count.index + 1}"
  count               = var.vm_count
  tags                = local.tags
}

resource "azurerm_availability_set" "linux_avs" {
  name                         = "${var.vm-name-prefix}-avs"
  location                     = var.location
  resource_group_name          = var.rg
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
}


resource "azurerm_network_interface" "linux-nic" {
  count               = var.vm_count
  name                = "${var.nic-prefix}-${var.vm-name-prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg
  ip_configuration {
    name                          = "${var.vm-name-prefix}-ipconfig-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-ip[count.index].id
  }

  tags = local.tags
}

variable "vmlinux_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "vmlinux_priv_key_path" {
  default = "~/.ssh/id_rsa"
}

resource "azurerm_linux_virtual_machine" "vm-linux" {
  name                = "${var.vm-name-prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg
  computer_name       = "${var.vm-name-prefix}-${count.index + 1}"
  count               = var.vm_count

  availability_set_id = azurerm_availability_set.linux_avs.id

  tags = local.tags

  network_interface_ids = [
    azurerm_network_interface.linux-nic[count.index].id
  ]

  size                            = "Standard_B1s"
  admin_username                  = "kaushal"
  disable_password_authentication = true
  admin_ssh_key {
    username   = "kaushal"
    public_key = file(var.vmlinux_key_path)
  }

  os_disk {
    name                 = "${var.vm-name-prefix}-osdisk-${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 32
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19.04"
    version   = "latest"
  }
}
