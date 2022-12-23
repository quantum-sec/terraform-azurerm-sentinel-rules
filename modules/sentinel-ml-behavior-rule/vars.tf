variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "alert_rule_template_guid" {
  description = "The GUID of the alert rule template which is used for this Sentinel Machine Learning Behavior Analytics Alert Rule."
  type        = string
}
