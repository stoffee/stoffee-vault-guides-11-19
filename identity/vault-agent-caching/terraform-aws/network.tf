module "vault_demo_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.environment_name}-vpc"
  cidr = "10.0.0.0/16"

  azs             = [var.availability_zones]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.environment_name}-vpc"
  }
}
