# Simple SSO Environment Example - Environment Creation with a Custom Domain and a Trusted Email Domain

This example deploys a Simple SSO Environment, configures a custom domain and a trusted email domain, and outputs the required DNS records for domain validation.

# Usage

To run this example you need to:

Set the following variables:
```bash
export PINGONE_CLIENT_ID=$P1_ADMIN_CLIENT_ID
export PINGONE_CLIENT_SECRET=$P1_ADMIN_CLIENT_SECRET
export PINGONE_ENVIRONMENT_ID=$P1_ADMIN_ENV_ID
export PINGONE_REGION=$P1_ADMIN_REGION

export TF_VAR_license_name=$P1_LICENSE_NAME
export TF_VAR_custom_domain_name=$EXAMPLE_CUSTOM_DOMAIN_NAME
export TF_VAR_trusted_email_domain=$EXAMPLE_TRUSTED_EMAIL_DOMAIN
```

Where:
* `$P1_ADMIN_CLIENT_ID` resolves to the worker app client ID that has permissions to create a new environment in the organisation
* `$P1_ADMIN_CLIENT_SECRET` resolves to the worker app client secret that has permissions to create a new environment in the organisation
* `$P1_ADMIN_ENV_ID` resolves to the environment ID that contains the worker app client that has permissions to create a new environment in the organisation
* `$P1_ADMIN_REGION` resolves to the PingOne organisation's region.  Valid values are `AsiaPacific`, `Canada`, `Europe` and `NorthAmerica`
* `$P1_LICENSE_NAME` resolves to the name of a valid license in the PingOne organisation.  The license name can be found (and modified) in the PingOne Admin Console.  Please ensure that no duplicate license names exist in the PingOne organisation.
* `$EXAMPLE_CUSTOM_DOMAIN_NAME` resolves to a string that represents a custom front-end domain to apply to the environment.  For example, `auth.mydomain.com`.
* `$EXAMPLE_TRUSTED_EMAIL_DOMAIN` resolves to a string that represents a custom domain to be included in the `From` address of emails sent from the PingOne platform.  For example, `mydomain.com`.


Then execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.