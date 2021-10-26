output "all_rules" {
  description = "Set of unfiltered rule paths bundled in the rule pack."
  value       = module.rule_pack_rules.all_rules
}

output "rules" {
  description = "Set of rule paths bundled in the rule pack without being present in `var.exclude_rules`."
  value       = module.rule_pack_rules.rules
}
