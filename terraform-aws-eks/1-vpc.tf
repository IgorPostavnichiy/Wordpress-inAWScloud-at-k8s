module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.3"

  name = "igor-vpc-main"
  cidr = "10.0.0.0/16"

  azs = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Environment = "staging"
  }
}