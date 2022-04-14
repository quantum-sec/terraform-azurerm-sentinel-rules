variable "display_name" {
  type = string
}

# The default condition is when Status = Active
variable "conditions" {
  default = [{
    operator = "Equals"
    property = "IncidentStatus"
    values   = ["Active"]
  }]

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
