resource "azurerm_network_interface" "linux-nic" {
  count = var.nb-count
  name                = "${var.linux_name}-nic-${count.index+1}"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${count.index+1}"
    subnet_id                     = azurerm_subnet.network-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.linux-pip[count.index].id
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "linux-pip" {
  count = var.nb-count
  name                = "${var.linux_name}-pip-${count.index+1}"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}-pip-${count.index+1}"
  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count = var.nb-count
  name                = "${var.linux_name}-${count.index+1}"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  computer_name = "${var.linux_name}-${count.index+1}"

  size                = var.linux_size
  admin_username      = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [element(azurerm_network_interface.linux-nic[*].id, count.index+1)]

  tags = local.common_tags

  os_disk {
    name              = "${var.linux_name}-os-disk-${count.index+1}"
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

resource "azurerm_availability_set" "linux_avset" {
  name                = var.linux_avs
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}