terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir = "${path.module}/../../content/parsers/"
  files    = fileset(local.root_dir, "**/*.kql")
}

module "function" {
  source = "../sentinel-kql-function"

  for_each = toset([for file in local.files : file if(length(regexall("\\/Quantum_.*\\.kql$", file)) > 0 && length(regexall("^uncategorized", file)) == 0)])

  log_analytics_workspace_id = var.log_analytics_workspace_id

  source_path = local.root_dir
  description = "Quantum Parser Functions"
  name        = replace(basename(each.value), ".kql", "")
  application = replace(each.value, basename(each.value), "")
  tags        = var.tags
}
