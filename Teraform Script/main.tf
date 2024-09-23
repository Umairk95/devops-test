
resource "azurerm_resource_group" "montoring-rg" {
  name     = var.montoring_resource_group
  location = var.montoring_resource_location
}

