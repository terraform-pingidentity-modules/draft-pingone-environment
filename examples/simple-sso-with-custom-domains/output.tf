output "dns_verification_entries_trusted_email_domains" {
  value = module.pingone_environment.dns_verification_entries_trusted_email_domains
}

output "dns_verification_entries_custom_domain" {
  value = module.pingone_environment.dns_verification_entries_custom_domain
}

output "environment_id" {
  value = module.pingone_environment.environment_id
}

output "default_population_id" {
  value = module.pingone_environment.default_population_id
}

output "license_id" {
  value = module.pingone_environment.license_id
}

output "schema_id_users" {
  value = module.pingone_environment.schema_id_users
}

output "resource_id_openid" {
  value = module.pingone_environment.resource_id_openid
}

output "resource_id_pingone_api" {
  value = module.pingone_environment.resource_id_pingone_api
}