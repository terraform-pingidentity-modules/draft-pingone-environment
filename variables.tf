
variable "license_id" {
  description = "PingOne License ID to assign to the environment.  If set, will take precidence over the license ID found from using the `license_name` parameter."
  type        = string
  default = null
}

variable "license_name" {
  description = "PingOne License Name - Used to obtain the `license_id`.  If using `license_name`, only one license of the same name should exist in the environment.  Licenses can be individually named in the admin console."
  type        = string
  default = null
}

variable "admin_environment_name" {
  description = "PingOne Admin Environment Name, used to assign admin user role permissions and lookup the current organization ID.  Defaults to `Administrators`."
  type        = string
  default     = "Administrators"
}

variable "admin_environment_id" {
  description = "PingOne Admin Environment ID, used to assign admin user role permissions and lookup the current organization ID.  If set, will take precidence over the `admin_environment_name` parameter."
  type        = string
  default     = null
}

# Environment Admin
variable "role_assignment_environment_admin_user_id_list" {
  description = "A list of user IDs that should be assigned the `Environment Admin` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# Configuration Read Only
variable "role_assignment_configuration_read_only_user_id_list" {
  description = "A list of user IDs that should be assigned the `Configuration Read Only` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# Identity Data Admin
variable "role_assignment_identity_data_admin_user_id_list" {
  description = "A list of user IDs that should be assigned the `Identity Data Admin` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# Identity Data Read Only
variable "role_assignment_identity_data_read_only_user_id_list" {
  description = "A list of user IDs that should be assigned the `Identity Data Read Only` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# Client Application Developer
variable "role_assignment_client_application_developer_user_id_list" {
  description = "A list of user IDs that should be assigned the `Client Application Developer` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# PingFederate Administrator
variable "role_assignment_pingfederate_administrator_user_id_list" {
  description = "A list of user IDs that should be assigned the `PingFederate Administrator` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# PingFederate Expression Administrator
variable "role_assignment_pingfederate_expression_administrator_user_id_list" {
  description = "A list of user IDs that should be assigned the `PingFederate Expression Administrator` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# PingFederate Crypto Administrator
variable "role_assignment_pingfederate_crypto_administrator_user_id_list" {
  description = "A list of user IDs that should be assigned the `PingFederate Crypto Administrator` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# PingFederate User Administrator
variable "role_assignment_pingfederate_user_administrator_user_id_list" {
  description = "A list of user IDs that should be assigned the `PingFederate User Administrator` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

# PingFederate Auditor
variable "role_assignment_pingfederate_auditor_user_id_list" {
  description = "A list of user IDs that should be assigned the `PingFederate Auditor` role scoped to the PingOne environment."
  type        = list(string)
  default     = []
}

variable "target_environment_name" {
  description = "PingOne Target Environment Name"
  type        = string
}


variable "target_environment_description" {
  description = "PingOne Target Environment Description"
  type        = string
  default     = null
}

variable "target_environment_production_type" {
  description = "Enables the environment as a Production environment.  This enables features that prevent accidental deletion of an environment and associated data."
  type = bool
  default = false
}

variable "create_authorize" {
  description = "Create the PingOne Authorize Service"
  type        = bool
  default     = false
}

variable "create_davinci" {
  description = "Create the PingOne DaVinci Service"
  type        = bool
  default     = false
}

variable "create_fraud" {
  description = "Create the PingOne Fraud Service"
  type        = bool
  default     = false
}

variable "create_mfa" {
  description = "Create the PingOne MFA Service"
  type        = bool
  default     = false
}

variable "create_risk" {
  description = "Create the PingOne Risk Service"
  type        = bool
  default     = false
}

variable "create_verify" {
  description = "Create the PingOne Verify Service"
  type        = bool
  default     = false
}

variable "custom_domain_name" {
  description = "The custom front end domain name to apply to the environment. (e.g., `auth.yourdomain.com`)"
  type = string
  default = null
}

variable "trusted_email_domains" {
  description = "The domains to be included in the `From` address in your emails (e.g., `mydomain.com`)"
  type = list(string)
  default = []
}

variable "enable_locales" {
  description = "The list of ISO standard language codes to enable in the environment.  For more information about standard language codes, see [ISO Language Code Table](http://www.lingoes.net/en/translator/langcode.htm)."
  type = list(string)
  default = ["en"]
}

variable "default_locale" {
  description = "The default locale for the environment."
  type = string
  default = "en"
}
