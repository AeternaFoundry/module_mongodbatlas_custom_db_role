resource "mongodbatlas_custom_db_role" "custom_db_roles" {
  for_each = var.custom_db_roles

  project_id = each.value.project_id
  role_name  = each.value.role_name

  dynamic "actions" {
    for_each = each.value.actions != null ? each.value.actions : []
    content {
      action = actions.value.action
      dynamic "resources" {
        for_each = actions.value.resources
        content {
          cluster         = resources.value.cluster
          collection_name = resources.value.collection_name
          database_name   = resources.value.database_name
        }
      }
    }
  }

  dynamic "inherited_roles" {
    for_each = each.value.inherited_roles != null ? each.value.inherited_roles : []
    content {
      database_name = inherited_roles.value.database_name
      role_name     = inherited_roles.value.role_name
    }
  }
}

