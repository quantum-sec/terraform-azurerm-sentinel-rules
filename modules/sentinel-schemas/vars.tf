variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace with which the saved searches will be associated."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "content_path_schemas" {
  description = <<-EOT
  The path to the rule schemas directory.

  Default empty value will use pre-packaged schemas.
  If you have packs in /opt/xdr/content/schemas then you may want to provide a value of "/opt/xdr/content/schemas"
  EOT
  type        = string
  default     = ""
}
