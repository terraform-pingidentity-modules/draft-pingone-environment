output "environment_id" {
  value = pingone_environment.env_instance.id

  // We want roles to propagate first before the module is considered "done", so we can use it with the DV provider without race condition
  depends_on = [
    pingone_role_assignment_user.identity_data_admin_role,
    pingone_role_assignment_user.environment_admin_role
  ]
}

output "default_population_id" {
  value = pingone_environment.env_instance.default_population_id
}

output "identity_data_admin_role" {
  value = pingone_role_assignment_user.identity_data_admin_role
}

output "environment_admin_role" {
  value = pingone_role_assignment_user.environment_admin_role
}

output "dns_verification_entries_custom_domain" {
  value = length(pingone_custom_domain.this) > 0 ? {
    type   = "CNAME"
    value  = pingone_custom_domain.this[0].canonical_name
    domain = pingone_custom_domain.this[0].domain_name
  } : null
}

output "dns_verification_entries_trusted_email_domains" {
  //value = module.trusted_email_domain
  value = flatten([
    for domain_key, domain in module.trusted_email_domain : [
      for record_key, record in domain.dns_verification_entries : {
        domain = record.domain
        name = record.name
        type = record.type
        value = record.value
      }
    ]
  ])
}

output "license_id" {
  value = pingone_environment.env_instance.license_id
}

output "resource_id_openid" {
  value = data.pingone_resource.openid.id
}

output "resource_id_pingone_api" {
  value = data.pingone_resource.pingone_api.id
}

output "schema_id_users" {
  value = data.pingone_schema.user.id
}