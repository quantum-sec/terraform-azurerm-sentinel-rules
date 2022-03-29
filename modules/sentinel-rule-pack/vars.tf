variable "path" {
  description = "The relative path of the rule pack definition from the packs directory, excluding its file extension."
  type        = string
  validation {
    condition     = length(toset([var.path, trimsuffix(var.path, ".yml"), trimsuffix(var.path, ".yaml")])) == 1
    error_message = "Do not include the file extension in the path to the rule pack."
  }
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace in which Azure Sentinel is deployed."
  type        = string
}

variable "exclude_rules" {
  description = "A set of rule paths that will be excluded from rules found in `var.path`.\nThese are relative paths from the `content/rules` directory (e.g. `linux/ssh-brute-force-detected`)."
  type        = set(string)
  default     = []
}

variable "content_path_rules" {
  description = <<-EOT
  The path to the rules directory.

  Default empty value will use pre-packaged rules.
  If you have rules in /opt/xdr/content/rules then you may want to provide a value of "/opt/xdr/content/rules"
  EOT
  type        = string
  default     = ""
}

variable "content_path_packs" {
  description = <<-EOT
  The path to the rule packs directory.

  Default empty value will use pre-packaged rule packs.
  If you have rule packs in /opt/xdr/content/packs then you may want to provide a value of "/opt/xdr/content/packs"
  EOT
  type        = string
  default     = ""
}
