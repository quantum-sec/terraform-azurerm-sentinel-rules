terraform {
  # https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
  required_version = ">= 0.13.0"
}

module "rule_pack_rules" {
  source = "../sentinel-rule-pack-rules"

  content_path_packs = var.content_path_packs
  path               = var.path
  exclude_rules      = var.exclude_rules
}

module "rule" {
  source = "../sentinel-library-rule"

  for_each = module.rule_pack_rules.rules

  log_analytics_workspace_id = var.log_analytics_workspace_id

  content_path_rules = var.content_path_rules

  path = each.value
}
