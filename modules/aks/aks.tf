resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "prod-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "prodaks"
  kubernetes_version  = "1.35"

  default_node_pool {
    name                 = "system"
    vm_size              = "Standard_D2s_v3"
    node_count           = 2
    vnet_subnet_id       = var.aks_subnet_id
    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 2
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    service_cidr   = "172.16.0.0/16"
    dns_service_ip = "172.16.0.10"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}