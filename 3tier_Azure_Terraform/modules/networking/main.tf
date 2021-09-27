  resource "azurerm_virtual_network" "test" {
   name                = var.vnet_name
   address_space       = var.address_space
   location            = var.rg_location
   resource_group_name = var.resource_group_name
  }

 resource "azurerm_subnet" "snet01" {
   name                 = var.snet01_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = var.snet01_prefix
 }
 resource "azurerm_subnet" "snet02" {
   name                 = var.snet02_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = var.snet02_prefix
 }
  resource "azurerm_subnet" "snet03" {
   name                 = var.snet03_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = var.snet03_prefix
   
 }
   resource "azurerm_subnet" "snet04" {
   name                 = var.snet04_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = var.snet04_prefix
   service_endpoints    = ["Microsoft.Sql"]
   
 }
 
 resource "azurerm_network_security_group" "frontendnsg" {
  name                = "frontendnsg"
  location            = var.rg_location
  resource_group_name = var.resource_group_name
 
}
 resource "azurerm_network_security_rule" "fensgrules" {
  for_each                    = local.fensgrules 
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.frontendnsg.name
}

resource "azurerm_subnet_network_security_group_association" "fensgassoc" {

  subnet_id                 = azurerm_subnet.snet01.id
  network_security_group_id = azurerm_network_security_group.frontendnsg.id
}

 resource "azurerm_network_security_group" "backendnsg" {
  name                = "backendnsg"
  location            = var.rg_location
  resource_group_name = var.resource_group_name
 
}
 resource "azurerm_network_security_rule" "bensgrules" {
  for_each                    = local.bensgrules 
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.backendnsg.name
}

resource "azurerm_subnet_network_security_group_association" "bensgassoc" {

  subnet_id                 = azurerm_subnet.snet02.id
  network_security_group_id = azurerm_network_security_group.backendnsg.id
}
 resource "azurerm_network_security_group" "dbnsg" {
  name                = "dbnsg"
  location            = var.rg_location
  resource_group_name = var.resource_group_name
 
}
 resource "azurerm_network_security_rule" "dbnsgrules" {
  for_each                    = local.dbnsgrules 
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.dbnsg.name
}

resource "azurerm_subnet_network_security_group_association" "dbnsgassoc" {

  subnet_id                 = azurerm_subnet.snet04.id
  network_security_group_id = azurerm_network_security_group.dbnsg.id
}