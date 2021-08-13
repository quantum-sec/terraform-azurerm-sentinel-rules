# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AZURE SENTINEL SCHEDULED ALERT RULES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12.26"
}

locals {
  incident_configuration = var.create_incident == null ? [] : ["enabled"]
}

resource "azurerm_sentinel_alert_rule_scheduled" "rule" {
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = var.display_name
  severity                   = var.severity
  query                      = var.query
  tactics                    = var.tactics
  description                = var.description
  enabled                    = var.enabled
  query_frequency            = var.query_frequency
  query_period               = var.query_period
  suppression_duration       = var.suppression_duration
  suppression_enabled        = var.suppression_enabled
  trigger_operator           = var.trigger_operator
  trigger_threshold          = var.trigger_threshold

  dynamic incident_configuration {
    for_each = local.incident_configuration
    content {
      create_incident = var.create_incident
      grouping {
        enabled                 = var.create_incident
        lookback_duration       = var.lookback_duration
        reopen_closed_incidents = var.reopen_closed_incidents
        entity_matching_method  = var.entity_matching_method
        group_by                = var.group_by
      }
    }
  }
}