terraform {
  required_version = ">= 0.12.26"
}

locals {
  root_dir = coalesce(var.content_path_functions, "${path.module}/../../content/functions")
  files    = fileset("${local.root_dir}/", "*.kql")
}

module "function" {
  source = "../sentinel-data-shaping-function"

  for_each = local.files

  log_analytics_workspace_id = var.log_analytics_workspace_id
  content_path_functions     = local.root_dir

  name = replace(basename(each.value), ".kql", "")
  tags = var.tags
}
