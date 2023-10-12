variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}

variable "automation_rule" {
  description = "Automation rule to be deployed."
  type        = string
}

#variable "logic_app_id" {
#  description = "Resource ID of the SOAR Webhook connector logic app."
#  type        = string
#}

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
