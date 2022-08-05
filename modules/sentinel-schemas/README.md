<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_function"></a> [function](#module\_function) | git::git@github.com:quantum-sec/package-log-analytics.git//modules/log-analytics-saved-search | 1.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace with which the saved searches will be associated. | `string` | n/a | yes |
| <a name="input_content_path_schemas"></a> [content\_path\_schemas](#input\_content\_path\_schemas) | The path to the rule schemas directory.<br><br>Default empty value will use pre-packaged schemas.<br>If you have packs in /opt/xdr/content/schemas then you may want to provide a value of "/opt/xdr/content/schemas" | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | A map of function aliases to their corresponding unique identifiers. |
<!-- END_TF_DOCS -->
