##
# Find our vpc_id and the like via the comman services remote_state s3 key.
data "terraform_remote_state" "shared_infra" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    region = var.region
    bucket = var.shared_state_bucket
    key    = var.shared_state_key
  }
}
