terraform {
  required_version = ">= 0.12.26"
}

locals {
  query = file("${path.module}/../../content/functions/${var.name}.kql")
}

module "function" {
  source = "git::git@github.com:quantum-sec/package-log-analytics.git//modules/log-analytics-saved-search?ref=1.2.0"

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name           = var.name
  display_name   = var.name
  category       = "Quantum Data Shaping Functions"
  query          = local.query
  function_alias = var.name
  tags           = var.tags
}
