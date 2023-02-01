# Simple SSO Environment Example - Environment creation by License ID or by License Name

This example deploys two Simple SSO Environments without any role assignments, one using the ID of a license and the other using the name of a license as found in the PingOne administration console.

# Usage

To run this example you need to:

Set the following variables:
```bash
export PINGONE_CLIENT_ID=$P1_ADMIN_CLIENT_ID
export PINGONE_CLIENT_SECRET=$P1_ADMIN_CLIENT_SECRET
export PINGONE_ENVIRONMENT_ID=$P1_ADMIN_ENV_ID
export PINGONE_REGION=$P1_ADMIN_REGION

export TF_VAR_license_id=$P1_LICENSE_ID
export TF_VAR_license_name=$P1_LICENSE_NAME
```

Where:
* `$P1_ADMIN_CLIENT_ID` resolves to the worker app client ID that has permissions to create a new environment in the organisation
* `$P1_ADMIN_CLIENT_SECRET` resolves to the worker app client secret that has permissions to create a new environment in the organisation
* `$P1_ADMIN_ENV_ID` resolves to the environment ID that contains the worker app client that has permissions to create a new environment in the organisation
* `$P1_ADMIN_REGION` resolves to the PingOne organisation's region.  Valid values are `AsiaPacific`, `Canada`, `Europe` and `NorthAmerica`
* `$P1_LICENSE_ID` resolves to the ID of a valid license in the PingOne organisation.  The license ID can be found in the PingOne Admin Console.
* `$P1_LICENSE_NAME` resolves to the name of a valid license in the PingOne organisation.  The license name can be found in the PingOne Admin Console.  Please ensure that no duplicate licenses with the same name exist.  Licenses can be renamed in the PingOne Admin Console.

Then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.