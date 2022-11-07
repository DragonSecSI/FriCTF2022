data "azurerm_resource_group" "frictf2022" {
  name = "friCTF"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "frictf"
  location            = data.azurerm_resource_group.frictf2022.location
  resource_group_name = data.azurerm_resource_group.frictf2022.name
  dns_prefix          = "frictf2022"

  default_node_pool {
    name    = "default"
    vm_size = "standard_d2as_v5"

    enable_auto_scaling = false
    node_count          = 2
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_public_ip" "challs_pwn" {
  name                = "challs_pwn_public_ip"
  resource_group_name = "MC_${data.azurerm_resource_group.frictf2022.name}_${azurerm_kubernetes_cluster.k8s.name}_${data.azurerm_resource_group.frictf2022.location}"
  location            = data.azurerm_resource_group.frictf2022.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "challs_web_path" {
  name                = "challs_web_path_public_ip"
  resource_group_name = "MC_${data.azurerm_resource_group.frictf2022.name}_${azurerm_kubernetes_cluster.k8s.name}_${data.azurerm_resource_group.frictf2022.location}"
  location            = data.azurerm_resource_group.frictf2022.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_container_registry" "acr" {
  name                = "frictf2022"
  resource_group_name = data.azurerm_resource_group.frictf2022.name
  location            = data.azurerm_resource_group.frictf2022.location
  sku                 = "Premium"
  admin_enabled       = false
}
