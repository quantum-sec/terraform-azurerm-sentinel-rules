<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_automation_rule.automation_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |
| [azurerm_sentinel_automation_rule.automation_rule_custom](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |
| [azurerm_sentinel_automation_rule.automation_rule_default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_logic_app_id"></a> [logic\_app\_id](#input\_logic\_app\_id) | n/a | `string` | n/a | yes |
| <a name="input_unique_prefix"></a> [unique\_prefix](#input\_unique\_prefix) | Unique string used to generate a UUID. | `string` | n/a | yes |
| <a name="input_action_order"></a> [action\_order](#input\_action\_order) | The execution order of this action | `number` | `1` | no |
| <a name="input_conditions"></a> [conditions](#input\_conditions) | n/a | <pre>list(object({<br>    operator = string<br>    property = string<br>    values   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_custom_automation_rule_path"></a> [custom\_automation\_rule\_path](#input\_custom\_automation\_rule\_path) | A path to the custom automation rules. | `string` | `""` | no |
| <a name="input_custom_automation_rules"></a> [custom\_automation\_rules](#input\_custom\_automation\_rules) | A list of custom automation rules to be deployed from the custom-workbooks folder. | `set(string)` | `[]` | no |
| <a name="input_default_automation_rules"></a> [default\_automation\_rules](#input\_default\_automation\_rules) | A list of default automation rules to be deployed. | `set(string)` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_expiration"></a> [expiration](#input\_expiration) | The UTC time in RFC3339 format | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the playbook is provisioned. | `string` | `""` | no |
| <a name="input_rule_order"></a> [rule\_order](#input\_rule\_order) | The order of this Sentinel Automation Rule | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the deployed automation rule. |
<!-- END_TF_DOCS -->
