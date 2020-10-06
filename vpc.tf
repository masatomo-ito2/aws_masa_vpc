provider aws {
	region = "ap-northeast-1"
}

module "masa_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.55.0"
  # insert the 14 required variables here

  name = "masademo-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "Masa Ito"
    Environment = "demo"
    TTL         = "-1"
  }

  vpc_tags = {
    Name        = "masademo-vpc"
    Owner       = "Masa Ito"
    Environment = "demo"
    TTL         = "-1"
  }
}
