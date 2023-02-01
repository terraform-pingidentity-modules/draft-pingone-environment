variable "license_id" {
  description = "PingOne License ID.  The license ID can be found in the administration console under \"Licenses\"."
  type        = string
}

variable "license_name" {
  description = "PingOne License name.  The license name can be found in the administration console under \"Licenses\".  Please ensure that no duplicate licenses with the same name exist.  Licenses can be renamed in the PingOne Admin Console."
  type        = string
}

variable "target_environment_name_by_license_id" {
  description = "PingOne Target Environment Name when using the License ID.  The name of the environment to create."
  type        = string
  default     = "pingone-environment Terraform module example - Simple SSO by license ID"
}

variable "target_environment_name_by_license_name" {
  description = "PingOne Target Environment Name when using the License Name.  The name of the environment to create."
  type        = string
  default     = "pingone-environment Terraform module example - Simple SSO by license name"
}