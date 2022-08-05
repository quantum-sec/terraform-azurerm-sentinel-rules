variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace with which the saved searches will be associated."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "content_path_parsers" {
  description = <<-EOT
  The path to the parsers directory.

  Default empty value will use pre-packaged parsers.
  If you have parsers in /opt/xdr/content/parsers then you may want to provide a value of "/opt/xdr/content/parsers"
  EOT
  type        = string
  default     = ""
}
