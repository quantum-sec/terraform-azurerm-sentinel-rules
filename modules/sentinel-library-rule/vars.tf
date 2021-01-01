variable "path" {
  description = "The relative path of the rule definition from the rules directory, excluding its file extension."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}
