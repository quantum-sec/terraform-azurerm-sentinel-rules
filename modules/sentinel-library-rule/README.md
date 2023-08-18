<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rule"></a> [rule](#module\_rule) | ../sentinel-scheduled-alert-rule | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The relative path of the rule definition from the rules directory, excluding its file extension. | `string` | n/a | yes |
| <a name="input_content_path_rules"></a> [content\_path\_rules](#input\_content\_path\_rules) | The path to the rules directory.<br><br>Default empty value will use pre-packaged rules.<br>If you have rules in /opt/xdr/content/rules then you may want to provide a value of "/opt/xdr/content/rules" | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->
