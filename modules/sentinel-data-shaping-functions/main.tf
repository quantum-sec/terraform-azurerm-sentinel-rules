terraform {
  required_version = ">= 0.12.26"
}

locals {
  files = fileset("${path.module}/../../content/functions/", "*.kql")
}

module "function" {
  source = "../sentinel-data-shaping-function"

  for_each = local.files

  log_analytics_workspace_id = var.log_analytics_workspace_id

  name = replace(basename(each.value), ".kql", "")
  tags = var.tags
}
