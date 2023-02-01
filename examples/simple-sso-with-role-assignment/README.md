# Simple SSO Environment Example - Environment Creation with Role Assignment

This example deploys a Simple SSO Environment and assigns the `Environment Admin` and `Identity Data Admin` roles to a named administrator.

# Usage

To run this example you need to:

Set the following variables:
```bash
export PINGONE_CLIENT_ID=$P1_ADMIN_CLIENT_ID
export PINGONE_CLIENT_SECRET=$P1_ADMIN_CLIENT_SECRET
export PINGONE_ENVIRONMENT_ID=$P1_ADMIN_ENV_ID
export PINGONE_REGION=$P1_ADMIN_REGION

export TF_VAR_license_name=$P1_LICENSE_NAME
export TF_VAR_admin_email_address=$ADMIN_EMAIL_ADDRESS
```

Where:
* `$P1_ADMIN_CLIENT_ID` resolves to the worker app client ID that has permissions to create a new environment in the organisation
* `$P1_ADMIN_CLIENT_SECRET` resolves to the worker app client secret that has permissions to create a new environment in the organisation
* `$P1_ADMIN_ENV_ID` resolves to the environment ID that contains the worker app client that has permissions to create a new environment in the organisation
* `$P1_ADMIN_REGION` resolves to the PingOne organisation's region.  Valid values are `AsiaPacific`, `Canada`, `Europe` and `NorthAmerica`
* `$P1_LICENSE_NAME` resolves to the name of a valid license in the PingOne organisation.  The license name can be found (and modified) in the PingOne Admin Console.  Please ensure that no duplicate license names exist in the PingOne organisation.
* `$ADMIN_EMAIL_ADDRESS` resolves to an email address of an administrator to assign the `Environment Admin` and `Identity Data Admin` roles to once the environment has been created.  Ensure that the administrator doesn't already have the `Environment Admin` role (scoped to the PingOne organisation) already assigned.

Then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.