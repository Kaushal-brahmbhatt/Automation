resource "azurerm_network_interface" "windows-nic" {
  for_each = var.windows_name

  name                = "${each.key}-nic"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = azurerm_subnet.network-subnet2.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "windows-pip" {
  for_each = var.windows_name

  name                = "${each.key}-pip"
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-pip"
  tags = local.common_tags
}

resource "azurerm_windows_virtual_machine" "windows-vm" {
  for_each = var.windows_name

  name                = each.key
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
  computer_name       = each.key

  size                = each.value
  admin_username      = var.windows_username
  admin_password      = var.windows_password

  network_interface_ids = [azurerm_network_interface.windows-nic[each.key].id]

  tags = local.common_tags

  os_disk {
    name              = "${each.key}-os-disk"
    caching           = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb      = var.os_disk_size
  }

  source_image_reference {
    publisher = var.windows_os_publisher
    offer     = var.windows_os_offer
    sku       = var.windows_os_sku
    version   = var.windows_os_version
  }

  winrm_listener {
    protocol = "Http"
  }
}

resource "azurerm_availability_set" "windows_avset" {
  name                = var.windows_avs
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name

  platform_fault_domain_count   = 2
  platform_update_domain_count = 5
}
