terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir  = "${path.module}/../../content/parsers/"
  files_raw = fileset(local.root_dir, "**/Quantum_*.kql")
  files     = toset([for file in local.files_raw : file if length(regexall("^uncategorized", file)) == 0])
}

module "function" {
  source = "../sentinel-kql-function"

  for_each = local.files

  log_analytics_workspace_id = var.log_analytics_workspace_id

  source_path = local.root_dir
  description = "Quantum Parser Functions"
  name        = replace(basename(each.value), ".kql", "")
  application = replace(each.value, "/${basename(each.value)}", "")
  tags        = var.tags
}
