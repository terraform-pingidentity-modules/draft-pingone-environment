provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = var.target_environment_name

  license_name         = var.license_name
  
  custom_domain_name    = var.custom_domain_name
  trusted_email_domains = [
    var.trusted_email_domain
  ]
}
