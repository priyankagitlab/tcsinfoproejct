# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/azure"
  

  # VPC Basic Details
  name = "vpc-test"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-2a", "us-east-2b"]
  private_subnets     = ["10.0.1.0/24"]
  public_subnets      = ["10.0.101.0/24"]

  # Database Subnets
  create_database_subnet_group = false
  create_database_subnet_route_table= true
  database_subnets    = ["10.0.151.0/24"]

  create_database_nat_gateway_route = true
  create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner = "vpclab"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev-terraform lab"
  }
}



