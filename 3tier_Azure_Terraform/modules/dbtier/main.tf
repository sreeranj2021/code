resource "azurerm_mysql_server" "dbtier" {
  name                = var.mysqlsrv_name
  location            = var.rg_location
  resource_group_name = var.resource_group_name
  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true
}

resource "azurerm_mysql_virtual_network_rule" "dbtier" {
  name                = "mysql-vnet-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.dbtier.name
  subnet_id           = var.dbsnet_id
}