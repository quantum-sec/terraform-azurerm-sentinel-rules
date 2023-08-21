terraform {
  # https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42"
    }
  }
}

locals {
  root_dir  = coalesce(var.content_path_packs, "${path.module}/../../content/packs")
  all_rules = toset(yamldecode(file("${local.root_dir}/${var.path}.yaml")).rules)
  rules     = setsubtract(local.all_rules, var.exclude_rules)
}
