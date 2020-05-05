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
      shared_state_file: my-remote-state
      shared_state_key: /path/to/my/remote/state/key
```

Inputs
------

### shared_state_file
S3 bucket containing Terraform Remote State data (read-only)
- required: true

### shared_state_key
S3 key containing Terraform Remote State data (read-only)
- required: true

### workspace
Terraform Workspace/AWS Account/Environment to query.
- required: true

Outputs
-------
All non-sensitive data defined in your remote-state-file
