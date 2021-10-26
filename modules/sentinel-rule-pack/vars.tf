variable "path" {
  description = "The relative path of the rule pack definition from the packs directory, excluding its file extension."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "exclude_rules" {
  description = "A set of rule paths that will be excluded from deployment to this instance. These are relative paths from the package-azure-sentinel's `content/rules` directory (e.g. `linux/ssh-brute-force-detected`).\nrules listed in this set will be excluded from `var.rule_packs` and `var.additional_rules`."
  type        = set(string)
  default     = []
}
