provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment_by_license_id" {
  source = "../../"

  target_environment_name = var.target_environment_name_by_license_id

  license_id = var.license_id
}

module "pingone_environment_by_license_name" {
  source = "../../"

  target_environment_name = var.target_environment_name_by_license_name

  license_name = var.license_name
}
