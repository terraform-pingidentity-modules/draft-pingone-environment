locals {
  use_license_id_var = (var.license_id != null && var.license_id != "")
  use_admin_environment_id_var = (var.admin_environment_id != null && var.admin_environment_id != "")

  admin_environment_id = local.use_admin_environment_id_var ? var.admin_environment_id : (data.pingone_environment.administrators != null) ? data.pingone_environment.administrators[0].id : null
  license_id = local.use_license_id_var ? var.license_id : data.pingone_licenses.org_licenses[0].ids[0]

  bootstrap_locales = ["de", "en", "es", "fr", "fr-CA", "it", "ja", "ko", "nl", "pt", "ru", "th", "tr", "zh"]
  bootstrap_enabled_locales = setintersection(local.bootstrap_locales, var.enable_locales)
  created_enabled_locales = setsubtract(setsubtract(var.enable_locales, local.bootstrap_locales), [var.default_locale])
}


#########################################################################
# PineOne Admin Environment
#########################################################################
data "pingone_environment" "administrators" {
  count = !local.use_admin_environment_id_var ? 1 : 0

  name = try(var.admin_environment_name, "Administrators")
}

#########################################################################
# PingOne License ID
#########################################################################
data "pingone_licenses" "org_licenses" {
  count = !local.use_license_id_var ? 1 : 0

  organization_id = data.pingone_environment.administrators[0].organization_id

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
  type        = var.target_environment_production_type ? "PRODUCTION" : "SANDBOX"
  license_id  = local.license_id

  lifecycle {
    precondition {
      condition     = (var.license_id != null && var.license_id != "") || ((var.license_name != null && var.license_name != "") && length(data.pingone_licenses.org_licenses) == 1)
      error_message = "Ensure one of `license_id` or `license_name` is set in the module parameters.  If using `license_name`, only one license of the same name should exist in the environment.  Licenses can be individually named in the admin console."
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
# PingOne Role Assignment - Environment Admin
#########################################################################
data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

resource "pingone_role_assignment_user" "environment_admin" {
  for_each = toset(var.role_assignment_environment_admin_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - Configuration Read Only
#########################################################################
data "pingone_role" "configuration_read_only" {
  name = "Configuration Read Only"
}

resource "pingone_role_assignment_user" "configuration_read_only" {
  for_each = toset(var.role_assignment_configuration_read_only_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.configuration_read_only.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - Identity Data Admin
#########################################################################
data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

resource "pingone_role_assignment_user" "identity_data_admin" {
  for_each = toset(var.role_assignment_identity_data_admin_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - Identity Data Read Only
#########################################################################
data "pingone_role" "identity_data_read_only" {
  name = "Identity Data Read Only"
}

resource "pingone_role_assignment_user" "identity_data_read_only" {
  for_each = toset(var.role_assignment_identity_data_read_only_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.identity_data_read_only.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - Client Application Developer
#########################################################################
data "pingone_role" "client_application_developer" {
  name = "Client Application Developer"
}

resource "pingone_role_assignment_user" "client_application_developer" {
  for_each = toset(var.role_assignment_client_application_developer_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.client_application_developer.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - PingFederate Administrator
#########################################################################
data "pingone_role" "pingfederate_administrator" {
  name = "PingFederate Administrator"
}

resource "pingone_role_assignment_user" "pingfederate_administrator" {
  for_each = toset(var.role_assignment_pingfederate_administrator_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.pingfederate_administrator.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - PingFederate Expression Administrator
#########################################################################
data "pingone_role" "pingfederate_expression_administrator" {
  name = "PingFederate Expression Administrator"
}

resource "pingone_role_assignment_user" "pingfederate_expression_administrator" {
  for_each = toset(var.role_assignment_pingfederate_expression_administrator_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.pingfederate_expression_administrator.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - PingFederate Crypto Administrator
#########################################################################
data "pingone_role" "pingfederate_crypto_administrator" {
  name = "PingFederate Crypto Administrator"
}

resource "pingone_role_assignment_user" "pingfederate_crypto_administrator" {
  for_each = toset(var.role_assignment_pingfederate_crypto_administrator_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.pingfederate_crypto_administrator.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - PingFederate User Administrator
#########################################################################
data "pingone_role" "pingfederate_user_administrator" {
  name = "PingFederate User Administrator"
}

resource "pingone_role_assignment_user" "pingfederate_user_administrator" {
  for_each = toset(var.role_assignment_pingfederate_user_administrator_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.pingfederate_user_administrator.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Role Assignment - PingFederate Auditor
#########################################################################
data "pingone_role" "pingfederate_auditor" {
  name = "PingFederate Auditor"
}

resource "pingone_role_assignment_user" "pingfederate_auditor" {
  for_each = toset(var.role_assignment_pingfederate_auditor_user_id_list)

  environment_id       = local.admin_environment_id
  user_id              = each.key
  role_id              = data.pingone_role.pingfederate_auditor.id
  scope_environment_id = pingone_environment.env_instance.id
}


#########################################################################
# PingOne Custom Domain
#########################################################################
resource "pingone_custom_domain" "this" {
  count = var.custom_domain_name != null && var.custom_domain_name != "" ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  domain_name = var.custom_domain_name
}


#########################################################################
# PingOne Trusted Email Domain
#########################################################################
module "trusted_email_domain" {
  source = "./modules/trusted-email-domain"

  for_each = toset(var.trusted_email_domains)

  environment_id = pingone_environment.env_instance.id

  trusted_email_domain = each.key
}


#########################################################################
# Resource data sources
#########################################################################
data "pingone_resource" "openid" {
  environment_id = pingone_environment.env_instance.id

  name = "openid"
}

data "pingone_resource" "pingone_api" {
  environment_id = pingone_environment.env_instance.id

  name = "PingOne API"
}


#########################################################################
# Schema data sources
#########################################################################
data "pingone_schema" "user" {
  environment_id = pingone_environment.env_instance.id

  name = "User"
}


#########################################################################
# Languages
#########################################################################
data "pingone_language" "seed" {
  depends_on = [
    pingone_environment.env_instance
  ]

  environment_id = pingone_environment.env_instance.id

  locale = "en"
}

resource "time_sleep" "wait_5_seconds" {
  depends_on = [
    data.pingone_language.seed
  ]

  create_duration = "5s"
}

// Default
data "pingone_language" "default" {
  depends_on = [
    time_sleep.wait_5_seconds
  ]

  count = contains(local.bootstrap_locales, var.default_locale) ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  locale = var.default_locale
}

resource "pingone_language" "default" {
  depends_on = [
    time_sleep.wait_5_seconds
  ]

  count = !contains(local.bootstrap_locales, var.default_locale) ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  locale = var.default_locale
}

resource "pingone_language_update" "default" {
  depends_on = [
    time_sleep.wait_5_seconds
  ]

  count = var.default_locale != "en" ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  language_id = length(pingone_language.default) > 0 ? pingone_language.default[0].id : data.pingone_language.default[0].id
  enabled     = true
  default     = true
}

// Enable the rest in the list
resource "pingone_language" "created" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default
  ]

  for_each = toset(setsubtract(local.created_enabled_locales, [var.default_locale]))

  environment_id = pingone_environment.env_instance.id

  locale = each.key
}

resource "pingone_language_update" "created" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default,
    pingone_language.created
  ]

  for_each = pingone_language.created

  environment_id = pingone_environment.env_instance.id

  language_id = each.value.id
  enabled     = true
  default     = false
}

data "pingone_language" "bootstrap" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default
  ]

  for_each = toset(setsubtract(local.bootstrap_enabled_locales, [var.default_locale]))

  environment_id = pingone_environment.env_instance.id

  locale = each.key
}

resource "pingone_language_update" "bootstrap" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default
  ]

  for_each = data.pingone_language.bootstrap

  environment_id = pingone_environment.env_instance.id

  language_id = each.value.id
  enabled     = true
  default     = false
}

// Disable "en" if needed
data "pingone_language" "en" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default
  ]

  count = !contains(local.bootstrap_enabled_locales, "en") ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  locale = "en"
}

resource "pingone_language_update" "en" {
  depends_on = [
    time_sleep.wait_5_seconds,
    pingone_language_update.default
  ]

  count = !contains(local.bootstrap_enabled_locales, "en") ? 1 : 0

  environment_id = pingone_environment.env_instance.id

  language_id = data.pingone_language.en[0].id
  enabled     = false
  default     = false
}
