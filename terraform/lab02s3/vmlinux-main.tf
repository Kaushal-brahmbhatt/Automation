resource "azurerm_network_interface" "linux-nic" {
  name                = "${var.linux_name}-nic"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.network-subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux-pip" {
  name                = "${var.linux_name}-pip"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = var.linux_name
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = "${var.linux_name}"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  size                = var.linux_size
  admin_username      = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [azurerm_network_interface.linux-nic.id]

  os_disk {
    name              = "${var.linux_name}-os-disk"
    caching           = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb = var.os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_publisher
    offer     = var.ubuntu_offer
    sku       = var.ubuntu_sku
    version   = var.ubuntu_version
  }

  admin_ssh_key {
    username = var.admin_username
    public_key = file(var.pubkey)
  }
}