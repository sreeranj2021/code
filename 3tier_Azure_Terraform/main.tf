 resource "azurerm_resource_group" "test" {
   name     = "${var.env_prefix}rg${var.seq_id}"
   location = var.location
 }

module "networking" {
  source = "./modules/networking"
  vnet_name = "${var.env_prefix}vnet${var.seq_id}"
  rg_location = azurerm_resource_group.test.location
  address_space =  [var.vnet_iprange]
  resource_group_name = azurerm_resource_group.test.name
  snet01_name = "${var.env_prefix}${var.fe_type}snet${var.seq_id}"
  snet01_prefix = [var.snet01_iprange]
  snet02_name = "${var.env_prefix}${var.be_type}snet${var.seq_id}"
  snet02_prefix = [var.snet02_iprange]
  snet03_name = "${var.env_prefix}${var.jb_type}snet${var.seq_id}"
  snet03_prefix = [var.snet03_iprange]
  snet04_name = "${var.env_prefix}${var.db_type}snet${var.seq_id}"
  snet04_prefix = [var.snet04_iprange]
}
module "frontend" {
  source = "./modules/frontend"
  env_prefix = var.env_prefix
  rg_location = azurerm_resource_group.test.location
  type =  var.fe_type
  resource_group_name = azurerm_resource_group.test.name
  seq_id = var.seq_id
  fesnet_id = module.networking.fesnet_id
}
module "backend" {
  source = "./modules/backend"
  env_prefix = var.env_prefix
  rg_location = azurerm_resource_group.test.location
  type =  var.be_type
  resource_group_name = azurerm_resource_group.test.name
  seq_id = var.seq_id
  besnet_id = module.networking.besnet_id
}
module "dbtier" {
  source = "./modules/dbtier"
  mysqlsrv_name = "${var.env_prefix}${var.mysqlsrv_name}${var.seq_id}"
  rg_location = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  dbsnet_id = module.networking.dbsnet_id
}
