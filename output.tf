output "sns" {
  value = local.sns
}

output "setting" {
  value = local.setting
}

output "network" {
  value = local.network
}

output "cluster" {
  value = local.cluster
}

output "route_table_id" {
  value = {
    private = local.network["private_route_tbl"]
    public  = local.network["public_route_tbl"]
  }
}

output "subnet_id" {
  value = {
    private = local.network["private_subnets"]
    public  = local.network["public_subnets"]
  }
}

output "dns_zone_id" {
  value = local.dns
}

output "account" {
  value = {
    root_id = data.aws_caller_identity.current.account_id
    id = data.aws_ssm_parameter.account_id.value
  }
}
output "user" {
  value = {
    id  = data.aws_caller_identity.current.user_id
    arn = data.aws_caller_identity.current.arn
  }
}

output "external" {
  value = {
    id = data.aws_ssm_parameter.external_id.value
  }
}

output "project" {
  value = {
    name  = var.project
    owner = var.owner
    email = var.email
  }
}
