provider "hcp" {}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "sydney"
}

# VPC in Japan
# This module is inheritaing AWS_DEFAULT_REGION.
module "vpc_japan" {

  source  = "terraform-aws-modules/vpc/aws"
	version = "3.1.0"
  # insert the 14 required variables here

  name = "${var.prefix}-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  # enable_ipv6 = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnet_tags = {
    Name = var.private_subnet_tag
  }
  public_subnet_tags = {
    Name = var.public_subnet_tag
  }

  tags = {
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
    terraform   = true
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
	version = "3.1.0"
  # insert the 14 required variables here

  name = "${var.prefix}-vpc-core"

  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  # enable_ipv6 = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = false
  single_nat_gateway = false

  private_subnet_tags = {
    Name = var.private_subnet_tag
  }
  public_subnet_tags = {
    Name = var.public_subnet_tag
  }

  tags = {
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
    terraform   = true
  }

  vpc_tags = {
    Name        = "${var.prefix}-vpc"
    owner       = var.owner
    environment = var.environment
    TTL         = var.ttl
  }
}

# HCP Vault
data "hcp_hvn" "hcp_vault_hvn" {
  hvn_id = var.hvn_id
}

# Peering
data "aws_arn" "peer" {
  arn = module.vpc_japan.vpc_arn
}

resource "hcp_aws_network_peering" "peer" {
  hvn_id              = data.hcp_hvn.hcp_vault_hvn.hvn_id
	peering_id = var.hvn_peering_id
  peer_vpc_id         = module.vpc_japan.vpc_id
  peer_account_id     = module.vpc_japan.vpc_owner_id
  peer_vpc_region     = data.aws_arn.peer.region
}

resource "hcp_hvn_route" "peering-route" {
  hvn_link = hcp_hvn.hvn.self_link
  // you can find this ID in the HCP Portal in the peering details page in the list of routes
  hvn_route_id     = "a8dda9a8-0f69-4fa0-b38c-55be302fdddb"
  destination_cidr = module.vpc_japan.vpc_cidr_block
  target_link      = hcp_aws_network_peering.peering.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
}

