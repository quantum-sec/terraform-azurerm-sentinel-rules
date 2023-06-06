<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.42 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.42 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_automation_rule.automation_rule_custom](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |
| [azurerm_sentinel_automation_rule.automation_rule_default](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The type of environment (e.g. `dev`, `stage`, or `prod`). | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the playbook is provisioned. | `string` | n/a | yes |
| <a name="input_unique_name_prefix"></a> [unique\_name\_prefix](#input\_unique\_name\_prefix) | A unique string prepended to the resource name to ensure it is globally unique (i.e. your company name). | `string` | n/a | yes |
| <a name="input_custom_automation_rule_path"></a> [custom\_automation\_rule\_path](#input\_custom\_automation\_rule\_path) | A path to the custom automation rules. | `string` | `""` | no |
| <a name="input_custom_automation_rules"></a> [custom\_automation\_rules](#input\_custom\_automation\_rules) | A list of custom automation rules to be deployed from the custom-workbooks folder. | `set(string)` | `[]` | no |
| <a name="input_default_automation_rules"></a> [default\_automation\_rules](#input\_default\_automation\_rules) | A list of default automation rules to be deployed. | `set(string)` | `[]` | no |
<!-- END_TF_DOCS -->
