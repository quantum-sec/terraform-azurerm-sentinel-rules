variable "log_analytics_workspace_id" {
  type = string
}

variable "default_automation_rules" {
  description = "A list of default automation rules to be deployed."
  type        = set(string)
  default     = []
}

variable "custom_automation_rules" {
  description = "A list of custom automation rules to be deployed from the custom-workbooks folder."
  type        = set(string)
  default     = []
}

variable "custom_automation_rule_path" {
  description = "A path to the custom automation rules."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group in which the playbook is provisioned."
  type        = string
}

variable "unique_name_prefix" {
  description = "A unique string prepended to the resource name to ensure it is globally unique (i.e. your company name)."
  type        = string
}

variable "environment" {
  description = "The type of environment (e.g. `dev`, `stage`, or `prod`)."
  type        = string
}
