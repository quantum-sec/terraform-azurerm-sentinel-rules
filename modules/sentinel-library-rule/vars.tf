variable "path" {
  description = "The relative path of the rule definition from the rules directory, excluding its file extension."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "content_path_rules" {
  description = <<-EOT
  The path to the rules directory.

  Default empty value will use pre-packaged rules.
  If you have rules in /opt/xdr/content/rules then you may want to provide a value of "/opt/xdr/content/rules"
  EOT
  type        = string
  default     = ""
}
