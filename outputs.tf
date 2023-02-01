output "environment_id" {
  description = "The ID of the PingOne environment."
  value = pingone_environment.env_instance.id

  // We want roles to propagate first before the module is considered "done", so we can use it with the DV provider without race condition
  depends_on = [
    pingone_role_assignment_user.environment_admin,
    pingone_role_assignment_user.configuration_read_only,
    pingone_role_assignment_user.identity_data_admin,
    pingone_role_assignment_user.identity_data_read_only,
    pingone_role_assignment_user.client_application_developer,
    pingone_role_assignment_user.pingfederate_administrator,
    pingone_role_assignment_user.pingfederate_expression_administrator,
    pingone_role_assignment_user.pingfederate_crypto_administrator,
    pingone_role_assignment_user.pingfederate_user_administrator,
    pingone_role_assignment_user.pingfederate_auditor,
    time_sleep.wait_5_seconds
  ]
}

output "default_population_id" {
  description = "The ID of the default population of the PingOne environment."
  value = pingone_environment.env_instance.default_population_id
}

output "dns_verification_entries_custom_domain" {
  description = "A map that provides DNS details for use in custom domain verification."
  value = length(pingone_custom_domain.this) > 0 ? {
    type   = "CNAME"
    value  = pingone_custom_domain.this[0].canonical_name
    domain = pingone_custom_domain.this[0].domain_name
  } : null
}

output "dns_verification_entries_trusted_email_domains" {
  description = "A map that provides DNS details for use in trusted email domain verification."
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
  description = "The ID of the license found and applied to the PingOne environment."
  value = local.license_id
}

output "resource_id_openid" {
  description = "The ID of the `OpenID Connect` resource in the PingOne environment."
  value = data.pingone_resource.openid.id
}

output "resource_id_pingone_api" {
  description = "The ID of the `PingOne API` resource in the PingOne environment."
  value = data.pingone_resource.pingone_api.id
}

output "schema_id_users" {
  description = "The ID of the `User` schema in the PingOne environment."
  value = data.pingone_schema.user.id
}
