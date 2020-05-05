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
