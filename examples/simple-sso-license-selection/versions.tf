
terraform {
  required_version = ">= 0.13.1"

  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 0.7.0"
    }
  }
}
