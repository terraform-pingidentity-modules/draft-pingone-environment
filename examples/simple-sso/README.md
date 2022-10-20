# Simple SSO Environment Example

This example deploys a Simple SSO Environment.

# Usage

To run this example you need to:

Set the following variables:
```bash
export TF_VAR_target_environment_name="Simple SSO Example"
export TF_VAR_admin_environment_id=$P1_ADMIN_ENV_ID
export TF_VAR_admin_environment_client_id=$P1_ADMIN_ENV_CLIENT_ID
export TF_VAR_admin_environment_client_secret=$P1_ADMIN_ENV_CLIENT_SECRET
export TF_VAR_region=$P1_REGION
export TF_VAR_license_name=$P1_LICENSE_ID
```

Then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.