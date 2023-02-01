provider "pingone" {}

###############################################################################
# Environment Module
###############################################################################
module "pingone_environment" {
  source = "terraform-pingidentity-modules/environment/pingone"

  target_environment_name = var.target_environment_name

  license_id = var.license_id
}

###############################################################################
# Resource Attribute
###############################################################################
resource "pingone_resource_attribute" "my_resource_attribute" {
  environment_id = module.pingone_environment.environment_id
  resource_id    = module.pingone_environment.resource_id_openid

  name  = "exampleAttribute"
  value = "$${user.name.given}"
}

###############################################################################
# Resource Scope - Exising scope
###############################################################################
resource "pingone_resource_scope_openid" "override_resource_scope" {
  environment_id = module.pingone_environment.environment_id

  name = "profile"

  mapped_claims = [
    pingone_resource_attribute.my_resource_attribute.id
  ]
}

###############################################################################
# Resource Scope - New scope
###############################################################################
resource "pingone_resource_scope_openid" "my_new_resource_scope" {
  environment_id = module.pingone_environment.environment_id

  name = "newscope"

  mapped_claims = [
    pingone_resource_attribute.my_resource_attribute.id
  ]
}