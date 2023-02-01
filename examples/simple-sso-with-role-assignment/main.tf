provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "../../"

  target_environment_name = var.target_environment_name

  license_name         = var.license_name

  role_assignment_environment_admin_user_id_list   = data.pingone_users.admin_users.ids
  role_assignment_identity_data_admin_user_id_list = data.pingone_users.admin_users.ids
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
      var.admin_email_address
    ]
  }
}
