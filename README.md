APFM Shared Infrastructure
==========================
This action supplies the workflow with information about the AWS shared
infrastructure used by APFM. Since this information is sensitive, this action
must be added to a workflow as a git-submodule w/in the `.github/actions` path.

Usage
-----

For example, if your define the following `action.yaml`:
```yaml
  - name: My Deployment
    uses: aplaceformom/terraform-shared-state-action@master
    with:
      remote_state_bucket: apfm-terraform-remotestate
      remote_lock_table: terraform-statelock
      shared_state_key: /shared-infra/remotestate.file
```

Inputs
------

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

### workspace
Terraform Workspace/AWS Account/Environment to query.
- required: true

### debug
Enable action debugging
- reqired: false
- default: false

Outputs
-------
All non-sensitive data defined in your shared_state_key

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
