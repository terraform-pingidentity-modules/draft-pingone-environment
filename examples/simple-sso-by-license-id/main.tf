provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = var.target_environment_name

  license_id = var.license_id
}
