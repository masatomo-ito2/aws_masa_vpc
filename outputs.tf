# Japan
output "security_group_ssh_japan" {
	value = module.ssh_sg_japan.this_security_group_id
}

output "vpc_id_japan" {
	value = module.vpc_japan.vpc_id
}

output "public_subnets_japan" {
	value = module.vpc_japan.public_subnets
}

output "elastic_ip_japan" {
	value = module.vpc_japan.nat_public_ips
}

# Sydney
output "security_group_ssh_sydney" {
	value = module.ssh_sg_sydney.this_security_group_id
}

output "vpc_id_sydney" {
	value = module.vpc_sydney.vpc_id
}

output "public_subnets_sydney" {
	value = module.vpc_sydney.public_subnets
}

output "elastic_ip_sydney" {
	value = module.vpc_sydney.nat_public_ips
}
