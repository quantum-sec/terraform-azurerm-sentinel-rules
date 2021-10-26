terraform {
  # https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
  required_version = ">= 0.13.0"
}

locals {
  all_rules = toset(yamldecode(file("${path.module}/../../content/packs/${var.path}.yaml")).rules)
  rules     = setsubtract(local.all_rules, var.exclude_rules)
}
