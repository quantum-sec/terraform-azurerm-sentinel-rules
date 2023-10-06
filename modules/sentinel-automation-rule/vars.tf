variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}

variable "automation_rule" {
  description = "Automation rule to be deployed."
  type        = string
}

variable "logic_app_id" {
  description = "Resource ID of the SOAR Webhook connector logic app."
  type        = string
}
