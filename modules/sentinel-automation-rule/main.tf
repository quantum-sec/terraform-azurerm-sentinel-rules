terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.42"
    }
  }
  required_version = ">= 0.12.26"
}

# ---------------------------------------------------------------------------------------------------------------------
# FOR SOAR WEBHOOK DEPLOYMENT
# ---------------------------------------------------------------------------------------------------------------------

resource "azurerm_sentinel_automation_rule" "automation_rule" {
  display_name               = var.display_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuidv5("dns", var.unique_prefix)
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

# ---------------------------------------------------------------------------------------------------------------------
# CUSTOM CONTENT DEPLOYMENT FOR AUTOMATION RULE
# ---------------------------------------------------------------------------------------------------------------------

data "azurerm_subscription" "current" {
}

resource "azurerm_sentinel_automation_rule" "automation_rule_default" {

  for_each = var.default_automation_rules

  display_name               = jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["display_name"]
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuidv5("dns", jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["display_name"])
  order                      = jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["rule_order"]
  condition_json             = try(jsonencode(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["condition_json"]), null)
  triggers_on                = try(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["triggers_on"], null)
  triggers_when              = try(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["triggers_when"], null)

  // To deprecate in favor of condition_json
  dynamic "condition" {
    for_each = try(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["conditions"], [])

    content {
      operator = condition.value["operator"]
      property = condition.value["property"]
      values   = condition.value["values"]
    }
  }

  dynamic "action_playbook" {
    for_each = try(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["action_playbooks"], [])

    content {
      order        = action_playbook.value["order"]
      logic_app_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Logic/workflows/${action_playbook.value["logic_app_id"]}"
      tenant_id    = try(action_playbook.value["tenant_id"], null)
    }
  }

  dynamic "action_incident" {
    for_each = try(jsondecode(file("${path.module}/../../content/automation-rules/${each.value}.json"))["action_incidents"], [])

    content {
      order                  = action_incident.value["order"]
      status                 = try(action_incident.value["status"], null)
      classification         = try(action_incident.value["classification"], null)
      classification_comment = try(action_incident.value["classification_comment"], null)
      labels                 = try(action_incident.value["labels"], [])
      owner_id               = try(action_incident.value["owner_id"], null)
      severity               = try(action_incident.value["severity"], null)
    }
  }
}

resource "azurerm_sentinel_automation_rule" "automation_rule_custom" {

  for_each = var.custom_automation_rules

  display_name               = jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["display_name"]
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = uuidv5("dns", jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["display_name"])
  order                      = jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["rule_order"]
  condition_json             = try(jsonencode(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["condition_json"]), null)
  triggers_on                = try(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["triggers_on"], null)
  triggers_when              = try(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["triggers_when"], null)

  // To deprecate in favor of condition_json
  dynamic "condition" {
    for_each = try(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["conditions"], [])

    content {
      operator = condition.value["operator"]
      property = condition.value["property"]
      values   = condition.value["values"]
    }
  }

  dynamic "action_playbook" {
    for_each = try(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["action_playbooks"], [])

    content {
      order        = action_playbook.value["order"]
      logic_app_id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Logic/workflows/${action_playbook.value["logic_app_id"]}"
      tenant_id    = try(action_playbook.value["tenant_id"], null)
    }
  }

  dynamic "action_incident" {
    for_each = try(jsondecode(file("${var.custom_automation_rule_path}/${each.value}.json"))["action_incidents"], [])

    content {
      order                  = action_incident.value["order"]
      status                 = try(action_incident.value["status"], null)
      classification         = try(action_incident.value["classification"], null)
      classification_comment = try(action_incident.value["classification_comment"], null)
      labels                 = try(action_incident.value["labels"], [])
      owner_id               = try(action_incident.value["owner_id"], null)
      severity               = try(action_incident.value["severity"], null)
    }
  }
}
