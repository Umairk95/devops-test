

variable "subscription_id" {
  description = "Subscription Id"
  type = string
}
variable "tenant_id" {
  description = "Tenant ID "
  type = string
}

variable "montoring_resource_group" {
  description = "Resource Group"
  type = string
}

variable "montoring_resource_location" {
  description = "Resource Group Location"
  type = string
}

variable "montoring_cluster_name" {
  description = "Cluster Name"
  type = string
}

variable "montoring_acr" {
  description = "Azure Container Registry"
  type = string
  
}


variable "montoring_vm_size" {
  description = "montoring VM size "
  type = string
}




