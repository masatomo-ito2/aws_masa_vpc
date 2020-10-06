# SSH SG 

module "ssh_sg" {
  #source = "terraform-aws-modules/security-group/aws/modules/ssh"
	source  = "terraform-aws-modules/security-group/aws//modules/ssh"

	vpc_id = module.masa_vpc.default_vpc_id
	name = "ssh"	
}
