APFM Project Action
===================
This [GitHub Action][] begins the component workflow for a APFM project.  This
includes creation of the component S3 state bucket used to Terraform remote
state, initializing Terraform workspaces, and making available shared data via
a shared remote state path and in some cases service discovery via standardized
tagging within the infrastructure.

See also:
 - https://github.com/apfm-actions
 - https://help.github.com/en/actions

Usage
-----

For example, if your define the following `action.yaml`:
```yaml
  - name: My project
    uses: aplaceformom/terraform-project-base-action@master
    with:
      project: examples
      owner: MyTeam
      email: myteam@mydomain.org
      tf_assume_role: TerraformApply
      remote_state_bucket: apfm-terraform-remotestate
      remote_lock_table: terraform-statelock
      shared_state_key: terraform/apfm.tfstate
```

Inputs
------

### workspace
Terraform Workspace to operate from.  In terraform this is accessible as terraform.workspace. By default the git branch pattern will decide which workspace to use.
- required: false

### project
Project this service is member of. E.g. phoenix
- required: true

### owner
Project owner/team. E.g. myteam
- required: true

### email
Project owner/team email address. E.g. myteam@mycompany.com
- required: true

### dev
Git branch pattern to deploy to dev environment
- default: 'develop'

### stage
Git branch pattern to deploy to stage environment
- default: 'master'

### prod
Git branch pattern to deploy to prod environment
- default: 'tag'

### tf_assume_role
Specify role that later actions should assume. Only actions designed to work
with terraform-project-base will assume this role.
- default: unset

### remote_state_bucket
S3 bucket containing Terraform Remote State data (read-write)
- required: true

### remote_lock_table
DynamoDB Table for syncronizing access to the Terraform Remote State file.
- required: true

### shared_state_key
S3 key containing the Terraform data to be shared between projects (read-only).
This a read-only end-point supplied by your administrators (techops) for
tracking information about your infrastructure.
- required: true

### debug
Enable action debugging
- reqired: false
- default: false

Outputs
-------
All non-sensitive data defined in your shared_state_key.  In addition to the
list of outputs below, this action _also_ sets all outputs as environment
variables prefixed with TF_VAR. E.g. `TF_VAR_account_id`.

- account_root_id
- account_id
- cluster_azs
- cluster_cluster_name
- cluster_ecr_repo
- cluster_elk_endpoint
- cluster_execution_role
- cluster_execution_role_arn
- cluster_id
- cluster_private_subnets
- cluster_public_subnets
- cluster_region
- cluster_security_groups
- cluster_service_namespace_id
- cluster_vpc_id
- dns_zone_id_private
- dns_zone_id_public
- dns_zone_id_service
- external_id
- network_azs
- network_cidr_block
- network_dns_delegation_id
- network_igw_id
- network_power_user_role_arn
- network_private_route_tbl
- network_private_subnets
- network_public_route_tbl
- network_public_subnets
- network_region
- network_vpc_id
- route_table_id_private
- route_table_id_public
- setting_admin
- setting_admin_email
- setting_admin_key
- setting_admin_key_name
- setting_domain_name
- setting_elkendpoint
- setting_enable_couchdb
- setting_enable_finance-cst
- setting_enable_sa_eks
- setting_enable_vpc_flow_logs
- setting_enable_vpn_gateway
- setting_enable_wptest
- setting_s3_remotestate_bucket_id
- setting_sa_eks_enable
- setting_subnet_prefix
- sns_alerts
- sns_notifications
- subnet_id_private
- subnet_id_public
- user_id
- user_arn

[//]: # (The following are reference links used elsewhere in the document)

[Git]: https://git-scm.com/
[GitHub]: https://www.github.com
[GitHub Actions]: https://help.github.com/en/actions
[Terraform]: https://www.terraform.io/
[Docker]: https://www.docker.com
[Dockerfile]: https://docs.docker.com/engine/reference/builder/
