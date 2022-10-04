output "environment_id" {
  value = pingone_environment.env_instance.id
}

output "identity_data_admin_role" {
  value = pingone_role_assignment_user.identity_data_admin_role
}
output "environment_admin_role" {
  value = pingone_role_assignment_user.environment_admin_role
}
