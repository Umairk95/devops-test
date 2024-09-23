
terraform {
  backend "azurerm" {
    storage_account_name = "montoringstorage"
    container_name       = ""
    key                  = ""
    access_key           = ""
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.93.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.13.2"
      
    }

  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.montoring_cluster.kube_config[0].cluster_ca_certificate)
}
