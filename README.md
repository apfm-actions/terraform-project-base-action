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
