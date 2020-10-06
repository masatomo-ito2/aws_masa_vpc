# SSH SG 

# SG in Japan
module "ssh_sg_japan" {
	provider = {
		aws = aws.japan
	}

	source  = "terraform-aws-modules/security-group/aws//modules/ssh"

	vpc_id = module.vpc_japan.vpc_id
	name = "ssh"	

	ingress_cidr_blocks  = [ "0.0.0.0/0" ]
}

# SG in Sydney
module "ssh_sg_sydney" {
	provider = {
		aws = aws.sydney
	}

	source  = "terraform-aws-modules/security-group/aws//modules/ssh"

	vpc_id = module.vpc_sydney.vpc_id
	name = "ssh"	

	ingress_cidr_blocks  = [ "0.0.0.0/0" ]
}
