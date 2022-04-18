terraform {
  required_version = ">= 0.12.26"
}

resource "azurerm_sentinel_automation_rule" "automation_rule" {
  display_name               = var.display_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuid()
  order                      = var.rule_order
  enabled                    = var.enabled
  expiration                 = var.expiration

  dynamic "condition" {
    for_each = var.conditions

    content {
      operator = condition.value["operator"]
      property = condition.value["property"]
      values   = condition.value["values"]
    }
  }

  action_playbook {
    logic_app_id = var.logic_app_id
    order        = var.action_order
  }
}
