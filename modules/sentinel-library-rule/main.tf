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

  rule_name = element(local.path_elements, length(local.path_elements) - 1)
}

module "rule" {
  source = "../sentinel-scheduled-alert-rule"

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name         = local.rule_name
  display_name = lookup(local.rule_data, "displayName", local.rule_name)
  description  = lookup(local.rule_data, "description", local.rule_name)
  severity     = local.rule_data["severity"]
  enabled      = lookup(local.rule_data, "enabled", null)
  tactics      = lookup(local.rule_data, "tactics", [])

  query           = local.rule_data["query"]
  query_frequency = "PT${upper(local.rule_data["queryFrequency"])}"
  query_period    = "PT${upper(local.rule_data["queryPeriod"])}"

  trigger_operator  = local.rule_data["triggerOperator"]
  trigger_threshold = local.rule_data["triggerThreshold"]

  suppression_duration = local.rule_data["suppressionEnabled"] == true ? "PT${upper(local.rule_data["suppressionDuration"])}" : null
  suppression_enabled  = lookup(local.rule_data, "suppressionEnabled", null)

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
