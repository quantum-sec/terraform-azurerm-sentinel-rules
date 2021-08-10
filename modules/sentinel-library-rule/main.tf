terraform {
  required_version = ">= 0.12.26"
}

locals {
  rule_data       = yamldecode(file("${path.module}/../../content/rules/${var.path}.yaml"))
  path_elements   = split("/", var.path)
  create_incident = local.rule_data["incidentConfiguration"] != null
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

  create_incident         = local.create_incident ? local.rule_data["incidentConfiguration"]["createIncident"] : false
  grouping                = local.create_incident ? local.rule_data["incidentConfiguration"]["grouping"]["enabled"] : false
  lookback_duration       = local.create_incident ? local.rule_data["incidentConfiguration"]["grouping"]["lookbackDuration"] : "PT5M"
  reopen_closed_incidents = local.create_incident ? local.rule_data["incidentConfiguration"]["grouping"]["reopenClosedIncidents"] : false
  entity_matching_method  = local.create_incident ? local.rule_data["incidentConfiguration"]["grouping"]["entityMatchingMethod"] : "None"
  group_by                = local.create_incident ? local.rule_data["incidentConfiguration"]["grouping"]["groupBy"] : []
}
