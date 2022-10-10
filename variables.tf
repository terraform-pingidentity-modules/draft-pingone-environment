
variable "organization_id" {
  description = "PingOne Organization ID"
  type        = string
}

variable "license_name" {
  description = "PingOne License Name"
  type        = string
}

variable "admin_environment_id" {
  description = "PingOne Admin Environment ID"
  type        = string
  default     = ""
}


variable "target_environment_name" {
  description = "PingOne Target Environment Name"
  type        = string
}


variable "target_environment_description" {
  description = "PingOne Target Environment Description"
  type        = string
  default     = ""
}

variable "admin_user_id" {
  description = "Target Environment Admin User ID"
  type        = string
  default     = ""
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
