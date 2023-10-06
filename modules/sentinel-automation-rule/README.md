<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.42 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_automation_rule.sentinel_automation_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_rule"></a> [automation\_rule](#input\_automation\_rule) | Automation rule to be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace. | `string` | n/a | yes |
| <a name="input_logic_app_id"></a> [logic\_app\_id](#input\_logic\_app\_id) | Resource ID of the SOAR Webhook connector logic app. | `string` | n/a | yes |
<!-- END_TF_DOCS -->
