# VPC for demo use

This will create 2 vpcs. 
1 in Japan, another in Sydney.

VPC settings will be stored in terraform state file on TFC.
Use `remote_state` to import VPC to your run.

```HCL
data terraform_remote_state "this" {
  backend = "remote"

  config = {
    organization = var.tfc_org
    workspaces = {
      name = var.tfc_ws
    }
  }
}
```
