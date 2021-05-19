terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir          = "${path.module}/../../content/parsers/"
  files             = fileset(local.root_dir, "**/Quantum_*.kql")
  categorized_files = toset([for f in local.files : f if length(regexall("^uncategorized", f)) == 0])
  file_map          = { for f in local.categorized_files : replace(basename(f), ".kql", "") => file("${local.root_dir}${f}") }
}

module "function" {
  source = "git::git@github.com:quantum-sec/package-log-analytics.git//modules/log-analytics-saved-search?ref=1.2.0"

  for_each = local.file_map

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name           = each.key
  display_name   = each.key
  category       = "Quantum Parser Functions"
  query          = each.value
  function_alias = each.key
  tags           = var.tags
}
