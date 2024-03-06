resource "azurerm_availability_set" "win_avs" {
  name                         = "${var.vm-name-prefix}-avs"
  location                     = var.location
  resource_group_name          = var.rg
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
}

resource "azurerm_public_ip" "win-ip" {
  name                = "${var.vm-name-prefix}-${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vm-name-prefix}-${count.index + 1}"
  count               = var.vm_count
  tags                = local.tags
}

resource "azurerm_network_interface" "win-nic" {
  count               = var.vm_count
  name                = "${var.nic-prefix}-${var.vm-name-prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg
  ip_configuration {
    name                          = "${var.vm-name-prefix}-ipconfig-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win-ip[count.index].id
  }

  tags = local.tags
}


resource "azurerm_windows_virtual_machine" "vm-win" {
  name                = "${var.vm-name-prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rg
  computer_name       = "${var.vm-name-prefix}-${count.index + 1}"
  count               = var.vm_count

  availability_set_id = azurerm_availability_set.win_avs.id

  tags = local.tags

  network_interface_ids = [
    azurerm_network_interface.win-nic[count.index].id
  ]

  size           = "Standard_B1s"
  admin_username = "kaushal"
  admin_password = "N01605052@Winuser"

  os_disk {
    name                 = "${var.vm-name-prefix}-osdisk-${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = 128
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
