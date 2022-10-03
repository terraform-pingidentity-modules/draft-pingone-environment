terraform {
  required_providers {
    pingone = {
      source = "pingidentity/pingone"
      #version = "~> 0.1"
    }
    davinci = {
      source = "samir-gandhi/davinci"
      #version = "~> 0.1"
    }
    
    http = {
      source = "hashicorp/http"
    }
  }
}
