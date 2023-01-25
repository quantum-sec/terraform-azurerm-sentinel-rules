<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.34 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.34 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_alert_rule_ms_security_incident.rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_alert_rule_ms_security_incident) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The friendly name of this rule. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace in which Azure Sentinel is deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the alert rule. | `string` | n/a | yes |
| <a name="input_product_filter"></a> [product\_filter](#input\_product\_filter) | The Microsoft Security Service from where the alert will be generated. Possible values are Azure Active Directory Identity Protection, Azure Advanced Threat Protection, Azure Security Center, Azure Security Center for IoT, Microsoft Cloud App Security, Microsoft Defender Advanced Threat Protection and Office 365 Advanced Threat Protection. | `string` | n/a | yes |
| <a name="input_severity_filter"></a> [severity\_filter](#input\_severity\_filter) | Only create incidents from alerts when alert severity level is contained in this list. Possible values are High, Medium, Low and Informational. | `set(string)` | n/a | yes |
| <a name="input_display_name_exclude_filter"></a> [display\_name\_exclude\_filter](#input\_display\_name\_exclude\_filter) | Only create incidents when the alert display name doesn't contain text from this list. | `set(string)` | `[]` | no |
| <a name="input_display_name_filter"></a> [display\_name\_filter](#input\_display\_name\_filter) | Only create incidents when the alert display name contain text from this list, leave empty to apply no filter. | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->
