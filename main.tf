#########################################################################
# PineOne Admin Environment
#########################################################################
data "pingone_environment" "administrators" {
  name = try(var.admin_environment_name, "Administrators")
}

#########################################################################
# PingOne License ID
#########################################################################
data "pingone_licenses" "org_licenses" {
  count = var.license_name != null && var.license_name != "" ? 1 : 0

  organization_id = var.organization_id != null && var.organization_id != "" ? var.organization_id : data.pingone_environment.administrators.organization_id

  data_filter {
    name   = "name"
    values = [var.license_name]
  }

  data_filter {
    name   = "status"
    values = ["ACTIVE"]
  }
}

#########################################################################
# PineOne Environment
#########################################################################
resource "pingone_environment" "env_instance" {
  name        = var.target_environment_name
  description = var.target_environment_description
  type        = "SANDBOX"
  license_id  = var.license_id != null && var.license_id != "" ? var.license_id : data.pingone_licenses.org_licenses[0].ids[0]

  lifecycle {
    precondition {
      condition     = (var.license_id != null && var.license_id != "") || ((var.license_name != null && var.license_name != "") && length(data.pingone_licenses.org_licenses) == 1)
      error_message = "Ensure one of `license_id` or `license_name` is set.  If using `license_name`, only one license must be returned."
    }
  }

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


#########################################################################
# PineOne Roles (Identity Data Admin, Environment Admin)
#########################################################################
data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}
data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}


#########################################################################
# PingOne Role Assignment
#########################################################################
resource "pingone_role_assignment_user" "identity_data_admin_role" {
  count = var.admin_user_assign_identity_admin_role && length(var.admin_user_id_list) > 0 ? length(var.admin_user_id_list) : 0

  environment_id       = var.admin_environment_id != null && var.admin_environment_id != "" ? var.admin_environment_id : data.pingone_environment.administrators.id
  user_id              = var.admin_user_id_list[count.index]
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}

resource "pingone_role_assignment_user" "environment_admin_role" {
  count = var.admin_user_assign_environment_admin_role && length(var.admin_user_id_list) > 0 ? length(var.admin_user_id_list) : 0

  environment_id       = var.admin_environment_id != null && var.admin_environment_id != "" ? var.admin_environment_id : data.pingone_environment.administrators.id
  user_id              = var.admin_user_id_list[count.index]
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}






