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
# Schema Attribute
###############################################################################
resource "pingone_schema_attribute" "my_attribute" {
  environment_id = module.pingone_environment.environment_id
  schema_id      = module.pingone_environment.schema_id_users

  name         = "myAttribute"
  display_name = "My Attribute"
  description  = "My new attribute"

  type        = "STRING"
  unique      = false
  multivalued = false
}