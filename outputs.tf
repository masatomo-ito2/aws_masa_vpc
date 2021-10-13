#Japan
output "vpc_id_japan" {
  value = module.vpc_japan.vpc_id
}

output "public_subnets_japan" {
  value = module.vpc_japan.public_subnets
}

output "vpc_arn_japan" {
  value = module.vpc_japan.vpc_arn
}

output "vpc_owner_id_japan" {
	value = module.vpc_japan.vpc_owner_id
}

output "vpc_cidr_block_japan" {
	value = module.vpc_japan.vpc_cidr_block"
}

# Sydney
output "vpc_id_sydney" {
  value = module.vpc_sydney.vpc_id
}

output "public_subnets_sydney" {
  value = module.vpc_sydney.public_subnets
}

output "vpc_arn_sydney" {
  value = module.vpc_sydney.vpc_arn
}

output "vpc_owner_id_sydney" {
	value = module.vpc_sydney.vpc_owner_id
}

output "vpc_cidr_block_sydney" {
	value = module.vpc_sydney.vpc_cidr_block"
}
