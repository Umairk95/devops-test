resource "azurerm_container_registry" "montoring_acr" {
  name                     = var.montoring_acr
  resource_group_name      = azurerm_resource_group.montoring-rg.name
  location                 = azurerm_resource_group.montoring-rg.location
  sku                      = "Basic"
  admin_enabled            = true
}

output "acr_login_server" {
  description = "The URL of the Azure Container Registry"
  value       = azurerm_container_registry.montoring_acr.login_server
}

output "acr_admin_username" {
  description = "The Username of the Azure Container Registry"
  value       = azurerm_container_registry.montoring_acr.admin_username

}

output "acr_admin_password" {
  description = "The Password of the Azure Container Registry"
  value       = azurerm_container_registry.montoring_acr.admin_password
  sensitive   = true
}
