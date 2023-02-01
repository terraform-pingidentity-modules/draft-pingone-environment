#########################################################################
# PingOne Trusted Email Domain
#########################################################################
resource "pingone_trusted_email_domain" "this" {
  environment_id = var.environment_id

  domain_name = var.trusted_email_domain
}

data "pingone_trusted_email_domain_dkim" "this" {
  environment_id = var.environment_id

  trusted_email_domain_id = pingone_trusted_email_domain.this.id
}

data "pingone_trusted_email_domain_ownership" "this" {
  environment_id = var.environment_id

  trusted_email_domain_id = pingone_trusted_email_domain.this.id
}

data "pingone_trusted_email_domain_spf" "this" {
  environment_id = var.environment_id

  trusted_email_domain_id = pingone_trusted_email_domain.this.id
}
