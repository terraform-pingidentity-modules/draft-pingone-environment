variable "license_id" {
  description = "PingOne License ID.  The license ID can be found in the administration console under \"Licenses\"."
  type        = string
}

variable "target_environment_name" {
  description = "PingOne Target Environment Name.  The name of the environment to create."
  type        = string
  default     = "pingone-environment Terraform module example - Extending the Directory Schema"
}
