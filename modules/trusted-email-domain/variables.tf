variable "environment_id" {
    type = string
    description = "The ID of the environment to assign the trusted email domain to."
}

variable "trusted_email_domain" {
    type = string
    description = "The domain to be included in the `From` address in your emails (e.g., `mydomain.com`)"
}
