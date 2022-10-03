output "environment_id" {
  value = pingone_environment.env_instance.id
}

output "admin_role" {
  value = pingone_role_assignment_user.admin_role
}
