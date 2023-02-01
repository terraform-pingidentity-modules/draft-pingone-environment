provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = var.target_environment_name

  license_name         = var.license_name
  
  default_locale = "fr"
  enable_locales = ["de", "fr", "es", "en-GB", "en", "nl", "it"]
}
