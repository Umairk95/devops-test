
resource "azurerm_kubernetes_cluster" "montoring_cluster" {
  name                = var.montoring_cluster_name
  location            = azurerm_resource_group.montoring-rg.location
  resource_group_name = azurerm_resource_group.montoring-rg.name
  dns_prefix          = "montoring"

  default_node_pool {
    name       = "default"
    vm_size    = var.montoring_vm_size
    #vm_size    = "Standard_B16ms"
  }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  #  network_policy    = "calico"
  }

  identity {
    type = "SystemAssigned"
  }

# resource "azurerm_kubernetes_cluster_node_pool" "additional" {
#   name                  = "additional"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.montoring_cluster.id
#   vm_size               = "Standard_DS2_v2"
#   os_sku                = "UbuntuLinux"
#   node_count            = 1
#   mode                  = "User"
#   enable_auto_scaling   = false
#   min_count             = 2
#   max_count             = 4
# }
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.montoring_cluster]
  filename     = "${var.montoring_cluster_name}-config"
  content      = azurerm_kubernetes_cluster.montoring_cluster.kube_config_raw
}



output "montoring_host" {
  value     = azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].host
  sensitive = true
}
output "montoring_client_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].client_certificate)
  sensitive = true
}
output "montoring_client_key" {
  value     = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].client_key)
  sensitive = true
}
output "montoring_cluster_ca_certificate" {
  value     = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].cluster_ca_certificate)
  sensitive = true
}
 
