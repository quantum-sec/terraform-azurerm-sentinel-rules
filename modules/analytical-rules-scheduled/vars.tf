variable "name" {
  description = "The name to assign to the alert rule."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "workspace id of LA workspace on which sentinel is deployed."
  type        = string
}

variable "display_name" {
  description = "The friendly name of this Sentinel Scheduled Alert Rule."
  type        = string
}

variable "severity" {
  description = "The alert severity of this Sentinel Scheduled Alert Rule. Possible values are High, Medium, Low and Informational."
  type        = string
}

variable "query" {
  description = " (Required) The query of this Sentinel Scheduled Alert Rule. This should also include workspace name of the customer onboarder via lighthouse."
  type        = string
}

variable "tactics" {
  description = "(Optional) A list of categories of attacks by which to classify the rule. Possible values are Collection, CommandAndControl, CredentialAccess, DefenseEvasion, Discovery, Execution, Exfiltration, Impact, InitialAccess, LateralMovement, Persistence and PrivilegeEscalation."
  type        = set(string)
}

variable "description" {
  description = "(Optional) The description of this Sentinel Scheduled Alert Rule."
  type        = string
}

variable "enabled" {
  description = "(Optional) Should the Sentinel Scheduled Alert Rule be enabled? Defaults to true."
  type        = bool
}

variable "query_frequency" {
  description = "(Optional) The ISO 8601 timespan duration between two consecutive queries. Defaults to PT5H."
  type        = string
}

variable "query_period" {
  description = "(Optional) The ISO 8601 timespan duration, which determine the time period of the data covered by the query. For example, it can query the past 10 minutes of data, or the past 6 hours of data. Defaults to PT5H."
  type        = string
}

variable "suppression_duration" {
  description = "(Optional) If suppression_enabled is true, this is ISO 8601 timespan duration, which specifies the amount of time the query should stop running after alert is generated. Defaults to PT5H."
  type        = string
}

variable "suppression_enabled" {
  description = "(Optional) Should the Sentinel Scheduled Alert Rules stop running query after alert is generated? Defaults to false."
  type        = bool
}

variable "trigger_operator" {
  description = "(Optional) The alert trigger operator, combined with trigger_threshold, setting alert threshold of this Sentinel Scheduled Alert Rule. Possible values are Equal, GreaterThan, LessThan, NotEqual."
  type        = string
}

variable "trigger_threshold" {
  description = "(Optional) The baseline number of query results generated, combined with trigger_operator, setting alert threshold of this Sentinel Scheduled Alert Rule."
  type        = string
}
