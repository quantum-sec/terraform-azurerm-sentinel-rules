terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir                 = coalesce(var.content_path_rules, "${path.module}/../../content/rules")
  rule_data                = yamldecode(file("${local.root_dir}/${var.path}.yaml"))
  path_elements            = split("/", var.path)
  create_incident          = try(lookup(local.rule_data["incidentConfiguration"], "createIncident", false), false)
  create_incident_grouping = try(lookup(local.rule_data["incidentConfiguration"], "grouping", {}), {})
  entity_mappings          = try(lookup(local.rule_data, "entityMappings", []), [])
  trigger_operator         = try(lookup(local.rule_data["triggerOperator"]), "gt")
  rule_name                = element(local.path_elements, length(local.path_elements) - 1)
}

module "rule" {
  source = "../sentinel-scheduled-alert-rule"

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name         = local.rule_name
  display_name = try(lookup(local.rule_data, "displayName", "name"), local.rule_name)
  description  = lookup(local.rule_data, "description", local.rule_name)
  severity     = lookup(title(local.rule_data["severity"]), "Low")
  enabled      = lookup(local.rule_data, "enabled", true)
  tactics      = lookup(local.rule_data, "tactics", [])

  query           = local.rule_data["query"]
  query_frequency = length(regexall(".*[Dd]$", local.rule_data["queryFrequency"])) > 0 ? "P${upper(local.rule_data["queryFrequency"])}T0H" : "PT${upper(local.rule_data["queryFrequency"])}"
  query_period    = length(regexall(".*[Dd]$", local.rule_data["queryPeriod"])) > 0 ? "P${upper(local.rule_data["queryPeriod"])}T0H" : "PT${upper(local.rule_data["queryPeriod"])}"

  trigger_operator  = local.trigger_operator == "gt" ? "GreaterThan" : local.trigger_operator == "lt" ? "LessThan" : local.trigger_operator
  trigger_threshold = lookup(local.rule_data["triggerThreshold"], "0")

  suppression_duration = try(local.rule_data["suppressionEnabled"] == true ? length(regexall(".*[YyMmDd]$", local.rule_data["suppressionDuration"])) > 0 ? "P${upper(local.rule_data["suppressionDuration"])}T0H" : "PT${upper(local.rule_data["suppressionDuration"])}" : null, null)
  suppression_enabled  = lookup(local.rule_data, "suppressionEnabled", false)

  create_incident         = local.create_incident
  grouping                = lookup(local.create_incident_grouping, "enabled", null)
  lookback_duration       = lookup(local.create_incident_grouping, "lookbackDuration", null)
  reopen_closed_incidents = lookup(local.create_incident_grouping, "reopenClosedIncidents", null)
  entity_matching_method  = lookup(local.create_incident_grouping, "entityMatchingMethod", "AnyAlert")
  group_by_entities       = lookup(local.create_incident_grouping, "groupByEntities", [])
  group_by_alert_details  = lookup(local.create_incident_grouping, "groupByAlertDetails", [])
  group_by_custom_details = lookup(local.create_incident_grouping, "groupByCustomDetails", [])
  entity_mappings         = local.entity_mappings
}
