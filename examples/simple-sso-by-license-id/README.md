# Simple SSO Environment Example - Environment creation with License ID

This example deploys a Simple SSO Environment without any role assignment, using the ID of a license as found in the PingOne administration console.

# Usage

To run this example you need to:

Set the following variables:
```bash
export PINGONE_CLIENT_ID=$P1_ADMIN_CLIENT_ID
export PINGONE_CLIENT_SECRET=$P1_ADMIN_CLIENT_SECRET
export PINGONE_ENVIRONMENT_ID=$P1_ADMIN_ENV_ID
export PINGONE_REGION=$P1_ADMIN_REGION

export TF_VAR_license_id=$P1_LICENSE_ID
```

Where:
* `$P1_ADMIN_CLIENT_ID` resolves to the worker app client ID that has permissions to create a new environment in the organisation
* `$P1_ADMIN_CLIENT_SECRET` resolves to the worker app client secret that has permissions to create a new environment in the organisation
* `$P1_ADMIN_ENV_ID` resolves to the environment ID that contains the worker app client that has permissions to create a new environment in the organisation
* `$P1_ADMIN_REGION` resolves to the PingOne organisation's region.  Valid values are `AsiaPacific`, `Canada`, `Europe` and `NorthAmerica`
* `$P1_LICENSE_ID` resolves to the ID of a valid license in the PingOne organisation.  The license ID can be found in the PingOne Admin Console.

Then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.