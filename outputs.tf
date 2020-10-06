output "security_group_ssh" {
	value = module.ssh_sg.this_security_group_id
}

output "vpc_id" {
	value = module.masa_vpc.vpc_id
}

output "public_subnets" {
	value = module.masa_vpc.public_subnets
}
