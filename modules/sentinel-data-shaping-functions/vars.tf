variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace with which the saved search will be associated."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "content_path_functions" {
  description = <<-EOT
  The path to the functions directory.

  Default empty value will use pre-packaged functions.
  If you have packs in /opt/xdr/content/functions then you may want to provide a value of "/opt/xdr/content/functions"
  EOT
  type        = string
  default     = ""
}
