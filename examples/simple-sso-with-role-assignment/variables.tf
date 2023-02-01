variable "license_name" {
  description = "PingOne License Name.  The license name can be found in the administration console under \"Licenses\".  Please ensure that there are no duplicate license names in the environment."
  type        = string
}

variable "target_environment_name" {
  description = "PingOne Target Environment Name.  The name of the environment to create."
  type        = string
  default     = "pingone-environment Terraform module example - Simple SSO with role assignment"
}

variable "admin_email_address" {
  description = "The administrator email address to assign `Environment Admin` and `Identity Data Admin` roles to upon creation.  Ensure that the email address used does not have the `Environment Admin` role (scoped to the organisation) already assigned."
  type        = string
}
