terraform {
  required_version = ">= 0.12.26"
}

locals {
  rules = yamldecode(file("${path.module}/../../content/packs/${var.path}.yaml")).rules
}

module "rule" {
  source = "../sentinel-library-rule"

  for_each = toset(local.rules)

  log_analytics_workspace_id = var.log_analytics_workspace_id

  path = each.value
}
