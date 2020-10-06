provider aws {
	region = "ap-northeast-1"
	alias = "japan"
}

provider aws {
	region = "ap-southeast-2"
	alias = "sydney"
}

# VPC in Japan
module "vpc_japan" {
	providers = {
		aws = aws.japan
	}

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.55.0"
  # insert the 14 required variables here

  name = "masa-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = false

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

# Create VPC in Sydney
module "vpc_sydney" {
	providers = {
		aws = aws.sydney
	}

  source  = "terraform-aws-modules/vpc/aws"
  version = "2.55.0"
  # insert the 14 required variables here

  name = "masa-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = false

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

