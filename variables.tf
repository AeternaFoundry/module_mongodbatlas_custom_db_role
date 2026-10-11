variable "custom_db_roles" {
  description = <<EOT
Map of custom_db_roles, attributes below
Required:
    - project_id
    - role_name
Optional:
    - actions (block):
        - action (required)
        - resources (required, block):
            - cluster (optional)
            - collection_name (optional)
            - database_name (optional)
    - inherited_roles (block):
        - database_name (required)
        - role_name (required)
EOT

  type = map(object({
    project_id = string
    role_name  = string
    actions = optional(list(object({
      action = string
      resources = list(object({
        cluster         = optional(bool)
        collection_name = optional(string)
        database_name   = optional(string)
      }))
    })))
    inherited_roles = optional(list(object({
      database_name = string
      role_name     = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.custom_db_roles : (
        v.actions == null || alltrue([for item in v.actions : (length(item.resources) >= 1)])
      )
    ])
    error_message = "Each resources list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.custom_db_roles : (
        (can(regex("[\\w-]+", v.role_name)))
      )
    ])
    error_message = "all of: `role_name` can contain only letters, digits, underscores, and dashes (1 further check(s) enforced by the provider, not mirrored here)"
  }
}

