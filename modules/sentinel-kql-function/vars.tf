variable "name" {
  description = "The name of the parser function. This is the filename within the content/parsers directory in the module and is also used as the function alias."
  type        = string

  validation {
    condition     = length(regexall("^Quantum_", var.name)) > 0
    error_message = "The name is invalid, it should start with Quantum."
  }
}

variable "application" {
  description = "The directory structure in which the function is nested, typically representing the target application whose logs and events are parsed by this parser."
  type        = string

  validation {
    condition     = (var.application != "uncategorized" && length(regexall("^[^\\.][^:\\*\\?\"<>\\|]+$", var.application)) > 0)
    error_message = "The application directory should not be uncategorized and sould be a valid folder name."
  }
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

variable "source_path" {
  description = "The root directory where the functions are located."
  type        = string
}

variable "description" {
  description = "The ID of the Log Analytics workspace with which the saved search will be associated."
  type        = string
}
