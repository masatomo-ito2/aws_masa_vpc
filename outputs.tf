#Japan
output "vpc_id_japan" {
  value = module.vpc_japan.vpc_id
}

output "public_subnets_japan" {
  value = module.vpc_japan.public_subnets
}

# Sydney
output "vpc_id_sydney" {
  value = module.vpc_sydney.vpc_id
}

output "public_subnets_sydney" {
  value = module.vpc_sydney.public_subnets
}

# HCP

locals {
  v = data.hcp_vault_cluster.vault_cluster
}

output "vault_public_url" {
  value = local.v.vault_public_endpoint_url
}

output "vault_private_url" {
  value = local.v.vault_private_endpoint_url
}

output "vault_info" {

  value = <<EOF
cloud_provider = ${local.v.cloud_provider}
created_at = ${local.v.created_at}
hvn_id = ${local.v.hvn_id}
organization_id = ${local.v.organization_id}
project_id = ${local.v.project_id}
min_vault_version = ${local.v.min_vault_version}
vault_version = ${local.v.vault_version}
namespace = ${local.v.namespace}
region = ${local.v.region}
tier = ${local.v.tier}
public_endpoint = ${local.v.public_endpoint}
EOF
}
