output "vnet_name" {
  value = azurerm_virtual_network.test.name
}
output "fesnet_name" {
  value = azurerm_subnet.snet01.name
}
output "fesnet_id" {
  value = azurerm_subnet.snet01.id
}
output "besnet_name" {
  value = azurerm_subnet.snet02.name
}
output "besnet_id" {
  value = azurerm_subnet.snet02.id
}
output "jbsnet_name" {
  value = azurerm_subnet.snet03.name
}
output "jbsnet_id" {
  value = azurerm_subnet.snet03.id
}
output "dbsnet_name" {
  value = azurerm_subnet.snet04.name
}
output "dbsnet_id" {
  value = azurerm_subnet.snet04.id
}