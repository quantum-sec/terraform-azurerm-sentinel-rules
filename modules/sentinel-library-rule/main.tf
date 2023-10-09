terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42"
    }
  }
}

locals {
  rule_data                = yamldecode(var.rule)
  path_elements            = split("/", var.path)
  rule_name                = element(local.path_elements, length(local.path_elements) - 1)
  create_incident          = try(lookup(local.rule_data["incidentConfiguration"], "createIncident", false), false)
  create_incident_grouping = try(lookup(local.rule_data["incidentConfiguration"], "grouping", {}), {})
  entity_mappings          = try(lookup(local.rule_data, "entityMappings", []), [])
}

resource "azurerm_sentinel_alert_rule_scheduled" "rule" {
  name                       = local.rule_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = lookup(local.rule_data, "displayName", local.rule_name)
  severity                   = title(local.rule_data["severity"])
  query                      = local.rule_data["query"]
  tactics                    = lookup(local.rule_data, "tactics", [])
  techniques                 = [for t in lookup(local.rule_data, "techniques", []) : substr(t, 0, 5)] # The expected format is 'T####', where '#' represents a digit. No support for sub-techniques yet.
  description                = lookup(local.rule_data, "description", local.rule_name)
  enabled                    = lookup(local.rule_data, "enabled", true)
  query_frequency            = length(regexall(".*[Dd]$", local.rule_data["queryFrequency"])) > 0 ? "P${upper(local.rule_data["queryFrequency"])}T0H" : "PT${upper(local.rule_data["queryFrequency"])}"
  query_period               = length(regexall(".*[Dd]$", local.rule_data["queryPeriod"])) > 0 ? "P${upper(local.rule_data["queryPeriod"])}T0H" : "PT${upper(local.rule_data["queryPeriod"])}"
  suppression_duration       = try(local.rule_data["suppressionEnabled"] == true ? length(regexall(".*[YyMmDd]$", local.rule_data["suppressionDuration"])) > 0 ? "P${upper(local.rule_data["suppressionDuration"])}T0H" : "PT${upper(local.rule_data["suppressionDuration"])}" : null, null)
  suppression_enabled        = lookup(local.rule_data, "suppressionEnabled", false)
  trigger_operator           = local.rule_data["triggerOperator"] == "gt" ? "GreaterThan" : local.rule_data["triggerOperator"] == "lt" ? "LessThan" : local.rule_data["triggerOperator"]
  trigger_threshold          = local.rule_data["triggerThreshold"]
  custom_details             = try(lookup(local.rule_data, "customDetails", {}), {})


  dynamic "incident_configuration" {
    for_each = local.create_incident == null ? [] : ["enabled"]
    content {
      create_incident = local.create_incident
      grouping {
        enabled                 = lookup(local.create_incident_grouping, "enabled", null)
        lookback_duration       = lookup(local.create_incident_grouping, "lookbackDuration", null)
        reopen_closed_incidents = lookup(local.create_incident_grouping, "reopenClosedIncidents", null)
        entity_matching_method  = lookup(local.create_incident_grouping, "entityMatchingMethod", "AnyAlert")
        group_by_entities       = lookup(local.create_incident_grouping, "groupByEntities", [])
        group_by_alert_details  = lookup(local.create_incident_grouping, "groupByAlertDetails", [])
        group_by_custom_details = lookup(local.create_incident_grouping, "groupByCustomDetails", [])
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = local.entity_mappings == null ? [] : local.entity_mappings
    content {
      entity_type = entity_mapping.value["entityType"]
      dynamic "field_mapping" {
        for_each = entity_mapping.value["fieldMappings"]
        content {
          identifier  = field_mapping.value["identifier"]
          column_name = field_mapping.value["columnName"]
        }
      }
    }
  }
}
