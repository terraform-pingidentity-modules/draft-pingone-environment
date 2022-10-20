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

  license_name         = var.license_name
  admin_user_id_list   = data.pingone_users.admin_users.ids
}

###############################################################################
# Supporting User selection
###############################################################################

data "pingone_environment" "administrators" {
  name = "Administrators"
}

data "pingone_users" "admin_users" {
  environment_id = data.pingone_environment.administrators.id

  data_filter {
    name = "email"
    values = [
      "myuser@bxretail.org"
    ]
  }
}