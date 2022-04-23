# FIXME: Due to limitations in old Terraform 0.11.x AWS providers we do not
# have the option to perform a `data` lookup of all of these resources.  Older
# AWS providers do not support the `filter { }` block on all data resource
# types. We must upgrade to a newer version of Terraform in order to gain
# access to updated providers which would solve this problem.  For now we must
# proxy through the SSM parameters.
locals {
  shared_prefix = "/shared-infra/${terraform.workspace}"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}
data "aws_ssm_parameter" "account_id" {
  name = "/terraform/${terraform.workspace}/account_id"
}
data "aws_ssm_parameter" "external_id" {
  name = "/terraform/${terraform.workspace}/external_id"
}

##
# Shared Settings
locals {
  setting_keys = [
    "domain_name",
    "admin",
    "admin_email",
    "admin_key_name",
    "admin_key",
    "s3_remotestate_bucket_id",
    "salescrm_es_master_type",
    "salescrm_es_master_count",
    "salescrm_es_instance_type",
    "salescrm_es_instance_count",
    "elkendpoint",
    "enable_vpn_gateway",
    "enable_vpc_flow_logs",
    "enable_finance-cst",
    "enable_sa_eks",
    "enable_wptest",
    "enable_couchdb",
  ]

  setting = zipmap(local.setting_keys, data.aws_ssm_parameter.setting.*.value)
}

data "aws_ssm_parameter" "setting" {
  count = length(local.setting_keys)
  name  = "${local.shared_prefix}/setting/${element(local.setting_keys, count.index)}"
}

##
# Default SNS notification topics
locals {
  sns_keys = ["alerts", "notifications"]
  sns      = zipmap(local.sns_keys, data.aws_ssm_parameter.sns.*.value)
}

data "aws_ssm_parameter" "sns" {
  count = length(local.sns_keys)
  name  = "${local.shared_prefix}/sns/${element(local.sns_keys, count.index)}"
}

##
# Shared Network Params
locals {
  network_keys = [
    "vpc_id",
    "igw_id",
    "region",
    "azs",
    "cidr_block",
    "private_subnets",
    "private_route_tbl",
    "public_subnets",
    "public_route_tbl",
    "dns_delegation_id",
    "power_user_role_arn",
  ]

  network = zipmap(local.network_keys, data.aws_ssm_parameter.network.*.value)
}

data "aws_ssm_parameter" "network" {
  count = length(local.network_keys)
  name  = "${local.shared_prefix}/network/${element(local.network_keys, count.index)}"
}

##
# ECS Cluster params
locals {
  cluster_keys = [
    "id",
    "vpc_id",
    "cluster_name",
    "name",
    "ecr_repo",
    "region",
    "azs",
    "public_subnets",
    "private_subnets",
    "service_namespace_id",
    "security_groups",
    "execution_role",
    "execution_role_arn",
    "elk_endpoint",
  ]

  cluster = zipmap(local.cluster_keys, data.aws_ssm_parameter.cluster.*.value)
}

data "aws_ssm_parameter" "cluster" {
  count = length(local.cluster_keys)
  name  = "${local.shared_prefix}/cluster/${element(local.cluster_keys, count.index)}"
}

##
# DNS Zone IDs
locals {
  dns_keys = ["public", "private", "service"]
  dns      = zipmap(local.dns_keys, data.aws_ssm_parameter.dns.*.value)
}

data "aws_ssm_parameter" "dns" {
  count = length(local.dns_keys)
  name  = "${local.shared_prefix}/dns_zone_id/${element(local.dns_keys, count.index)}"
}

##
# RDS params
locals {
  rds_keys = ["mysql", "postgresql"]
  rds      = zipmap(local.rds_keys, data.aws_ssm_parameter.rds.*.value)
}

data "aws_ssm_parameter" "rds" {
  count = length(local.rds_keys)
  name  = "${local.shared_prefix}/rds_identifier/${element(local.rds_keys, count.index)}"
}
