provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment_by_license_id" {
  source = "terraform-pingidentity-modules/environment/pingone"

  target_environment_name = var.target_environment_name_by_license_id

  license_id = var.license_id
}

module "pingone_environment_by_license_name" {
  source = "terraform-pingidentity-modules/environment/pingone"

  target_environment_name = var.target_environment_name_by_license_name

  license_name = var.license_name
}
