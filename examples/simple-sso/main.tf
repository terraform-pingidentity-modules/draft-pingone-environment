provider "pingone" {
  client_id      = var.admin_environment.client_id
  client_secret  = var.admin_environment.client_secret
  environment_id = var.admin_environment.id
  region         = var.region

  force_delete_production_type = false
}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = "TF-terry-test"

  organization_id      = var.organization_id
  license_name         = var.license_name
  admin_environment_id = var.admin_environment.id
  admin_user_id        = var.admin_environment.user_id
}
