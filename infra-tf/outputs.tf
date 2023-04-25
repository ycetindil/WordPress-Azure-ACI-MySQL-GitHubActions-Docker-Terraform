output "URL" {
  value = "http://${azurerm_container_group.ci.ip_address}/"
}