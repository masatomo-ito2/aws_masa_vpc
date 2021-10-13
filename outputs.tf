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

output "vault_public_url" {
  value = data.hcp_vault_cluster.vault_cluster.vault_public_endpoint_url
}

output "vault_private_url" {
  value = data.hcp_vault_cluster.vault_cluster.vault_private_endpoint_url
}
