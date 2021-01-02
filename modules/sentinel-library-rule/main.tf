

locals {
  rule_data = yamldecode(file("${path.module}/../../content/rules/${var.path}.yaml"))
}

module "rule" {
  source = "../sentinel-scheduled-alert-rule"

  name                       = var.path
  log_analytics_workspace_id = var.log_analytics_workspace_id

  display_name = local.rule_data["displayName"]
  description  = local.rule_data["description"]
  severity     = local.rule_data["severity"]
  enabled      = local.rule_data["enabled"]
  tactics      = local.rule_data["tactics"]

  query           = local.rule_data["query"]
  query_frequency = local.rule_data["queryFrequency"]
  query_period    = local.rule_data["queryPeriod"]

  trigger_operator  = local.rule_data["triggerOperator"]
  trigger_threshold = local.rule_data["triggerThreshold"]

  suppression_duration = local.rule_data["suppressionDuration"]
  suppression_enabled  = local.rule_data["suppressionEnabled"]
}
