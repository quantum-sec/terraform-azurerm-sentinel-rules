variable "name" {
  description = "The name of the data shaping function. This is the filename within the content/functions directory in the module and is also used as the function alias."
  type        = string
}

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
