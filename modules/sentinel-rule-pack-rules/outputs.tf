output "all_rules" {
  description = "Set of unfiltered rule paths bundled in the rule pack."
  value       = local.all_rules
}

output "excluded_rules" {
  description = "Set of rules that were found and excluded from rules provided by the rule pack at `var.path`."
  value       = setintersection(local.all_rules, var.exclude_rules)
}

output "rules" {
  description = "Set of rule paths bundled in the rule pack without being present in `var.exclude_rules`."
  value       = local.rules
}
