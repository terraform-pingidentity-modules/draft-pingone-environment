
variable "organization_id" {
  description = "PingOne Organization ID - Used to obtain license_id.  If set, will take precidence over the organization ID found from using the `admin_environment_name` parameter."
  type        = string
  default     = null
}

variable "license_id" {
  description = "PingOne License ID to assign to the environment.  If set, will take precidence over the license ID found from using the `license_name` parameter."
  type        = string
  default = null
}

variable "license_name" {
  description = "PingOne License Name - Used to obtain license_id"
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

variable "admin_user_id_list" {
  description = "PingOne Environment Admin User ID"
  type        = list(string)
  default     = []
}

variable "admin_user_assign_identity_admin_role" {
  description = "Assign the `Identity Data Admin` role to users set in the `admin_user_id_list` parameter."
  type        = bool
  default     = true
}

variable "admin_user_assign_environment_admin_role" {
  description = "Assign the `Environment Admin` role to users set in the `admin_user_id_list` parameter."
  type        = bool
  default     = true
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
