terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir = "${path.module}/../../content/parsers/"
  files    = fileset(local.root_dir, "**/*.kql")
}

module "function" {
  source = "../sentinel-parser"

  for_each = local.files

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name        = replace(basename(each.value), ".kql", "")
  application = replace(dirname(each.value), local.root_dir, "")
  tags        = var.tags
}
