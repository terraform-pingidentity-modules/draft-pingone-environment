


resource "pingone_environment" "env_instance" {
  name        = var.target_environment_name
  description = var.target_environment_description
  type        = "SANDBOX"
  license_id  = var.license_id

  default_population {
    name        = "My Population"
    description = "My new population for users"
  }

  dynamic "service" {
    for_each = var.create_authorize ? [1] : []

    content {
      type = "Authorize"
    }
  }

  dynamic "service" {
    for_each = var.create_davinci ? [1] : []

    content {
      type = "DaVinci"
    }
  }

  dynamic "service" {
    for_each = var.create_fraud ? [1] : []

    content {
      type = "Fraud"
    }
  }

  dynamic "service" {
    for_each = var.create_mfa ? [1] : []

    content {
      type = "MFA"
    }
  }

  dynamic "service" {
    for_each = var.create_risk ? [1] : []

    content {
      type = "Risk"
    }
  }

  dynamic "service" {
    for_each = var.create_verify ? [1] : []

    content {
      type = "Verify"
    }
  }

  service {
    type = "SSO"
  }

}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}
data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

resource "pingone_role_assignment_user" "identity_data_admin_role" {
  # count                = var.admin_user_id != "" && var.admin_environment_id != "" ? 1 : 0
  environment_id       = var.admin_environment_id
  user_id              = var.admin_user_id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}

resource "pingone_role_assignment_user" "environment_admin_role" {
  # count                = var.admin_user_id != "" && var.admin_environment_id != "" ? 1 : 0
  environment_id       = var.admin_environment_id
  user_id              = var.admin_user_id
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}






