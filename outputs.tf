output "custom_db_roles_id" {
  description = "Map of id values across all custom_db_roles, keyed the same as var.custom_db_roles except keys with no id are omitted"
  value       = { for k, v in mongodbatlas_custom_db_role.custom_db_roles : k => v.id if v.id != null && length(v.id) > 0 }
}
output "custom_db_roles_actions" {
  description = "Map of actions values across all custom_db_roles, keyed the same as var.custom_db_roles except keys with no actions are omitted"
  value       = { for k, v in mongodbatlas_custom_db_role.custom_db_roles : k => v.actions if v.actions != null && length(v.actions) > 0 }
}
output "custom_db_roles_inherited_roles" {
  description = "Map of inherited_roles values across all custom_db_roles, keyed the same as var.custom_db_roles except keys with no inherited_roles are omitted"
  value       = { for k, v in mongodbatlas_custom_db_role.custom_db_roles : k => v.inherited_roles if v.inherited_roles != null && length(v.inherited_roles) > 0 }
}
output "custom_db_roles_project_id" {
  description = "Map of project_id values across all custom_db_roles, keyed the same as var.custom_db_roles except keys with no project_id are omitted"
  value       = { for k, v in mongodbatlas_custom_db_role.custom_db_roles : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "custom_db_roles_role_name" {
  description = "Map of role_name values across all custom_db_roles, keyed the same as var.custom_db_roles except keys with no role_name are omitted"
  value       = { for k, v in mongodbatlas_custom_db_role.custom_db_roles : k => v.role_name if v.role_name != null && length(v.role_name) > 0 }
}

