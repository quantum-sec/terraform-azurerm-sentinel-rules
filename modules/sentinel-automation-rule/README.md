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
| [azurerm_sentinel_automation_rule.sentinel_automation_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_automation_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The type of environment (e.g. `dev`, `stage`, or `prod`). | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the playbook is provisioned. | `string` | n/a | yes |
| <a name="input_unique_name_prefix"></a> [unique\_name\_prefix](#input\_unique\_name\_prefix) | A unique string prepended to the resource name to ensure it is globally unique (i.e. your company name). | `string` | n/a | yes |
| <a name="input_file_path"></a> [file\_path](#input\_file\_path) | The file path to the automation rule. | `string` | `""` | no |
<!-- END_TF_DOCS -->
