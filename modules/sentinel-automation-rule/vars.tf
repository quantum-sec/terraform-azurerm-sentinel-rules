variable "log_analytics_workspace_id" {
  type = string
}

variable "file_path" {
  description = "The file path to the automation rule."
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
