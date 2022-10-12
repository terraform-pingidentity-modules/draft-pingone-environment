
terraform {
  required_version = ">= 0.13.1"

  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 0.6.0"
    }
    davinci = {
      source  = "samir-gandhi/davinci"
      version = ">= 0.0.7"
    }
  }
}
