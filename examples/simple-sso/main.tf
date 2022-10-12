provider "pingone" {
  client_id      = var.admin_environment_client_id
  client_secret  = var.admin_environment_client_secret
  environment_id = var.admin_environment_id
  region         = var.region

  force_delete_production_type = false
}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = var.target_environment_name

  organization_id      = var.organization_id
  license_name         = var.license_name
  admin_environment_id = var.admin_environment_id
  admin_user_id        = var.admin_environment_user_id
}
