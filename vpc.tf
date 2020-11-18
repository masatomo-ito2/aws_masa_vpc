provider aws {
	region = "ap-southeast-2"
	alias = "sydney"
}

# VPC in Japan
# This module is inheritaing AWS_DEFAULT_REGION.
module "vpc_japan" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.55.0"
  # insert the 14 required variables here

  name = "${var.prefix}-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    Name = var.public_subnet_tag
  }

  tags = {
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
		terraform 	= true
  }

  vpc_tags = {
    Name        = "${var.prefix}-vpc"
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
  }
}

# Create VPC in Sydney
# This module is using aliased aws provider pointing to sydney
module "vpc_sydney" {
	providers = {
		aws = aws.sydney
	}

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.55.0"
  # insert the 14 required variables here

  name = "${var.prefix}-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    Name = var.public_subnet_tag
  }

  tags = {
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
  }

  vpc_tags = {
    Name        = "${var.prefix}-vpc"
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
  }
}
	
