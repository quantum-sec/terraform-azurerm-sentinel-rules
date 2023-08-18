<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_function"></a> [function](#module\_function) | ../sentinel-data-shaping-function | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace with which the saved search will be associated. | `string` | n/a | yes |
| <a name="input_content_path_functions"></a> [content\_path\_functions](#input\_content\_path\_functions) | The path to the functions directory.<br><br>Default empty value will use pre-packaged functions.<br>If you have packs in /opt/xdr/content/functions then you may want to provide a value of "/opt/xdr/content/functions" | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
<!-- END_TF_DOCS -->
