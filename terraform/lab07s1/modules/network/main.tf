resource "azurerm_virtual_network" "network-vnet" {
  name                = "${var.network_name_prefix}-vnet"
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.network_address_space
}

resource "azurerm_subnet" "network-subnet1" {
  name                 = "${var.subnet_name_prefix}-1"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "network-subnet2" {
  name                 = "${var.subnet_name_prefix}-2"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_network_security_group" "network-nsg1" {
  name                = "${var.security_group_name_prefix}-ssh"
  location            = var.location
  resource_group_name = var.rg

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "network-nsg2" {
  name                = "${var.security_group_name_prefix}-rdp-1"
  location            = var.location
  resource_group_name = var.rg

  security_rule {
    name                       = "rule2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule3"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "network-nsg1-association" {
  subnet_id                 = azurerm_subnet.network-subnet1.id
  network_security_group_id = azurerm_network_security_group.network-nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "network-nsg2-association" {
  subnet_id                 = azurerm_subnet.network-subnet2.id
  network_security_group_id = azurerm_network_security_group.network-nsg2.id
}