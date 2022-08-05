variable "path" {
  description = "The relative path of the rule pack definition from the packs directory, excluding its file extension."
  type        = string
  validation {
    condition     = length(toset([var.path, trimsuffix(var.path, ".yml"), trimsuffix(var.path, ".yaml")])) == 1
    error_message = "Do not include the file extension in the path to the rule pack."
  }
}

variable "exclude_rules" {
  description = "A set of rule paths that will be excluded from rules found in `var.path`.\nThese are relative paths from the `content/rules` directory (e.g. `linux/ssh-brute-force-detected`)."
  type        = set(string)
  default     = []
}

variable "content_path_packs" {
  description = <<-EOT
  The path to the rule packs directory.

  Default empty value will use pre-packaged rule packs.
  If you have packs in /opt/xdr/content/packs then you may want to provide a value of "/opt/xdr/content/packs"
  EOT
  type        = string
  default     = ""
}
