variable "display_name" {
  type = string
}

variable "unique_prefix" {
  description = "Unique string used to generate a UUID."
  type        = string
}

# The default condition is when Status = Active
variable "conditions" {
  default = []

  type = list(object({
    operator = string
    property = string
    values   = list(string)
  }))
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "logic_app_id" {
  type = string
}

variable "rule_order" {
  description = "The order of this Sentinel Automation Rule"
  type        = number
  default     = 1
}

variable "action_order" {
  description = "The execution order of this action"
  type        = number
  default     = 1
}

variable "enabled" {
  type    = bool
  default = false
}

variable "expiration" {
  description = "The UTC time in RFC3339 format"
  type        = string
  default     = null
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
  default     = ""
}
