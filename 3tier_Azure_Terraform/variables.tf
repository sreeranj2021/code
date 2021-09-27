variable "env_prefix" {
  type        = string
  description = "Enviornment Name"
}
variable "fe_type" {
  type        = string
  description = "Frontend Tier type"
}
variable "be_type" {
  type        = string
  description = "Backend Tier type"
}
variable "jb_type" {
  type        = string
  description = "Jumpbox Tier type"
}
variable "db_type" {
  type        = string
  description = "DB Tier type"
}
variable "seq_id" {
  type        = string
  description = "Sequence ID"
}
variable "location" {
  type        = string
  description = "Location for resources deployment"
}
variable "vnet_iprange" {
  type        = string
  description = "Vnet IP range"
}
variable "snet01_iprange" {
  type        = string
  description = "Snet IP range"
}
variable "snet02_iprange" {
  type        = string
  description = "Snet IP range"
}
variable "snet03_iprange" {
  type        = string
  description = "Snet IP range"
}
variable "snet04_iprange" {
  type        = string
  description = "Snet IP range"
}
variable "mysqlsrv_name" {
  type        = string
  description = "Mysql Server name"
}