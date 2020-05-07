output "sns" {
  value = data.terraform_remote_state.shared_infra.outputs.sns
}

output "setting" {
  value = data.terraform_remote_state.shared_infra.outputs.setting
}

output "network" {
  value = data.terraform_remote_state.shared_infra.outputs.network
}

output "cluster" {
  value = data.terraform_remote_state.shared_infra.outputs.cluster
}

output "route_table_id" {
  value = data.terraform_remote_state.shared_infra.outputs.route_table_id
}

output "subnet_id" {
  value = data.terraform_remote_state.shared_infra.outputs.subnet_id
}

output "dns_zone_id" {
  value = data.terraform_remote_state.shared_infra.outputs.dns_zone_id
}

data "aws_caller_identity" "root" {}
data "aws_ssm_parameter" "account_id" {
  name = "/terraform/${terraform.workspace}/account_id"
}
output "account" {
  value = {
    root_id = data.aws_caller_identity.root.account_id
    id = data.aws_ssm_parameter.account_id.value
  }
}
output "user" {
  value = {
    id  = data.aws_caller_identity.root.user_id
    arn = data.aws_caller_identity.root.arn
  }
}

data "aws_ssm_parameter" "external_id" {
  name = "/terraform/${terraform.workspace}/external_id"
}
output "external" {
  value = {
    id = data.aws_ssm_parameter.external_id.value
  }
}
