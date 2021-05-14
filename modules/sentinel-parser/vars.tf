variable "name" {
  description = "The name of the parser function. This is the filename within the content/parsers directory in the module and is also used as the function alias."
  type        = string
}

variable "application" {
  description = "The target application where the parser would be applied."
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
