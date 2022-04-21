variable "display_name" {
  type = string
}

# The default condition is when Status = Active
variable "conditions" {
  default = []

  type = list(object({
    operator = string
    property = string
    values   = list(string)
  }))
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "logic_app_id" {
  type = string
}

variable "rule_order" {
  description = "The order of this Sentinel Automation Rule"
  type        = number
  default     = 1
}

variable "action_order" {
  description = "The execution order of this action"
  type        = number
  default     = 1
}

variable "enabled" {
  type    = bool
  default = false
}

variable "expiration" {
  description = "The UTC time in RFC3339 format"
  type        = string
  default     = null
}
