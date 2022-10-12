
variable "region" {}
variable "organization_id" {}
variable "license_name" {}

variable "admin_environment" {
  type = object({
    id            = string
    client_id     = string
    client_secret = string
    user_id       = string
  })
}
