<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | The relative path of the rule pack definition from the packs directory, excluding its file extension. | `string` | n/a | yes |
| <a name="input_content_path_packs"></a> [content\_path\_packs](#input\_content\_path\_packs) | The path to the rule packs directory.<br><br>Default empty value will use pre-packaged rule packs.<br>If you have packs in /opt/xdr/content/packs then you may want to provide a value of "/opt/xdr/content/packs" | `string` | `""` | no |
| <a name="input_exclude_rules"></a> [exclude\_rules](#input\_exclude\_rules) | A set of rule paths that will be excluded from rules found in `var.path`.<br>These are relative paths from the `content/rules` directory (e.g. `linux/ssh-brute-force-detected`). | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_rules"></a> [all\_rules](#output\_all\_rules) | Set of unfiltered rule paths bundled in the rule pack. |
| <a name="output_excluded_rules"></a> [excluded\_rules](#output\_excluded\_rules) | Set of rules that were found and excluded from rules provided by the rule pack at `var.path`. |
| <a name="output_rules"></a> [rules](#output\_rules) | Set of rule paths bundled in the rule pack without being present in `var.exclude_rules`. |
<!-- END_TF_DOCS -->
