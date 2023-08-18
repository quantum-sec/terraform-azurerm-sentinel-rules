<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rule"></a> [rule](#module\_rule) | ../sentinel-library-rule | n/a |
| <a name="module_rule_pack_rules"></a> [rule\_pack\_rules](#module\_rule\_pack\_rules) | ../sentinel-rule-pack-rules | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The relative path of the rule pack definition from the packs directory, excluding its file extension. | `string` | n/a | yes |
| <a name="input_content_path_packs"></a> [content\_path\_packs](#input\_content\_path\_packs) | The path to the rule packs directory.<br><br>Default empty value will use pre-packaged rule packs.<br>If you have rule packs in /opt/xdr/content/packs then you may want to provide a value of "/opt/xdr/content/packs" | `string` | `""` | no |
| <a name="input_content_path_rules"></a> [content\_path\_rules](#input\_content\_path\_rules) | The path to the rules directory.<br><br>Default empty value will use pre-packaged rules.<br>If you have rules in /opt/xdr/content/rules then you may want to provide a value of "/opt/xdr/content/rules" | `string` | `""` | no |
| <a name="input_exclude_rules"></a> [exclude\_rules](#input\_exclude\_rules) | A set of rule paths that will be excluded from rules found in `var.path`.<br>These are relative paths from the `content/rules` directory (e.g. `linux/ssh-brute-force-detected`). | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_rules"></a> [all\_rules](#output\_all\_rules) | Set of unfiltered rule paths bundled in the rule pack. |
| <a name="output_rules"></a> [rules](#output\_rules) | Set of rule paths bundled in the rule pack without being present in `var.exclude_rules`. |
<!-- END_TF_DOCS -->
