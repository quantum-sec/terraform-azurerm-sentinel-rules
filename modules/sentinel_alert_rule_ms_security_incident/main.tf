# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL MS SECURITY INCIDENT ALERT RULES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42"
    }
  }
}

resource "azurerm_sentinel_alert_rule_ms_security_incident" "rule" {
  name                        = var.name
  log_analytics_workspace_id  = var.log_analytics_workspace_id
  product_filter              = var.product_filter
  display_name                = var.display_name
  severity_filter             = var.severity_filter
  display_name_filter         = var.display_name_filter
  display_name_exclude_filter = var.display_name_exclude_filter
}
