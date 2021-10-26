terraform {
  required_version = ">= 0.12.26"
}

locals {
  pack_rules = yamldecode(file("${path.module}/../../content/packs/${var.path}.yaml")).rules
  rules      = setsubtract(local.pack_rules, var.exclude_rules)
}

module "rule" {
  source = "../sentinel-library-rule"

  for_each = toset(local.rules)

  log_analytics_workspace_id = var.log_analytics_workspace_id

  path = each.value
}
