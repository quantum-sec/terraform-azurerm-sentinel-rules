terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir                 = coalesce(var.content_path_rules, "${path.module}/../../content/rules")
  rule_data                = yamldecode(file("${local.root_dir}/${var.path}.yaml"))
  path_elements            = split("/", var.path)
  create_incident          = try(lookup(local.rule_data["incidentConfiguration"], "createIncident", false), false)
  create_incident_grouping = try(lookup(local.rule_data["incidentConfiguration"], "grouping", {}), {})
}

module "rule" {
  source = "../sentinel-scheduled-alert-rule"

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name         = element(local.path_elements, length(local.path_elements) - 1)
  display_name = local.rule_data["displayName"]
  description  = local.rule_data["description"]
  severity     = local.rule_data["severity"]
  enabled      = local.rule_data["enabled"]
  tactics      = local.rule_data["tactics"]

  query           = local.rule_data["query"]
  query_frequency = "PT${upper(local.rule_data["queryFrequency"])}"
  query_period    = "PT${upper(local.rule_data["queryPeriod"])}"

  trigger_operator  = local.rule_data["triggerOperator"]
  trigger_threshold = local.rule_data["triggerThreshold"]

  suppression_duration = local.rule_data["suppressionEnabled"] == true ? "PT${upper(local.rule_data["suppressionDuration"])}" : null
  suppression_enabled  = local.rule_data["suppressionEnabled"]

  create_incident         = local.create_incident
  grouping                = lookup(local.create_incident_grouping, "enabled", null)
  lookback_duration       = lookup(local.create_incident_grouping, "lookbackDuration", null)
  reopen_closed_incidents = lookup(local.create_incident_grouping, "reopenClosedIncidents", null)
  entity_matching_method  = lookup(local.create_incident_grouping, "entityMatchingMethod", "None")
  group_by                = lookup(local.create_incident_grouping, "groupByEntities", [])
}
