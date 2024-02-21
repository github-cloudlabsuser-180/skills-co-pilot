provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name     = "example-resources"
}

data "azurerm_log_analytics_workspace" "example" {
  name                = "example-workspace"
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "example-setting"
  target_resource_id         = data.azurerm_resource_group.example.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.example.id

  log {
    category = "Action"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }
}