locals {
  name_prefix = "${var.project_name}-az"
  location    = "brazilsouth"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.name_prefix}-rg"
  location = local.location
}

resource "azurerm_service_plan" "asp" {
  name                = "${local.name_prefix}-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  os_type  = "Windows"
  sku_name = "F1" # Free tier
}

resource "azurerm_windows_web_app" "api" {
  name                = "${local.name_prefix}-api"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    use_32_bit_worker = true
    always_on         = false
  }

  tags = {
    Environment = "lab-multicloud"
    Project     = var.project_name
  }
}

resource "random_string" "storage_suffix" {
  length  = 4
  upper   = false
  numeric = true
  special = false
}

resource "azurerm_storage_account" "logs" {
  name                     = "${replace(lower(local.name_prefix), "-", "")}${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "lab-multicloud"
    Project     = var.project_name
  }
}
