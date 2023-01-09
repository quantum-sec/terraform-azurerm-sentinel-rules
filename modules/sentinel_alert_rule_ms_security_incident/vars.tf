variable "name" {
  description = "The name to assign to the alert rule."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "display_name" {
  description = "The friendly name of this rule."
  type        = string
}

variable "product_filter" {
  description = "The Microsoft Security Service from where the alert will be generated. Possible values are Azure Active Directory Identity Protection, Azure Advanced Threat Protection, Azure Security Center, Azure Security Center for IoT, Microsoft Cloud App Security, Microsoft Defender Advanced Threat Protection and Office 365 Advanced Threat Protection."
  type        = string
}

variable "severity_filter" {
  description = "Only create incidents from alerts when alert severity level is contained in this list. Possible values are High, Medium, Low and Informational."
  type        = set(string)
}

variable "display_name_filter" {
  description = "Only create incidents when the alert display name contain text from this list, leave empty to apply no filter."
  type        = set(string)
  default     = []
}

variable "display_name_exclude_filter" {
  description = "Only create incidents when the alert display name doesn't contain text from this list."
  type        = set(string)
  default     = []
}
