##
# Find our vpc_id and the like via the comman services remote_state s3 key.
data "terraform_remote_state" "shared_infra" {
  backend   = "s3"

  config = {
    bucket = var.shared_state_file
    key    = var.shared_state_key
  }
}
