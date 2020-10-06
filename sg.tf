# SSH SG 

module "ssh_sg" {
  #source = "terraform-aws-modules/security-group/aws/modules/ssh"
	source  = "terraform-aws-modules/security-group/aws//modules/ssh"

	vpc_id = module.masa_vpc.vpc_id
	name = "ssh"	

	ingress_cidr_blocks  = [ "0.0.0.0/0" ]
}
