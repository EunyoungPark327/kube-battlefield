module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "pey-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    "Name"                          = "pey-pub-sub"
    "kubernetes.io/role/elb"        = 1
    "kubernetes.io/cluster/pey-eks" = "shared"
    "karpenter.sh/discovery"        = "pey-eks"
  }
  private_subnet_tags = {
    "Name"                            = "pey-prv-sub"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/pey-eks"   = "shared"
    "karpenter.sh/discovery"          = "pey-eks"
  }
  public_route_table_tags = {
    "Name" = "pey-pub-rtb"
  }
  private_route_table_tags = {
    "Name" = "pey-prv-rtb"
  }
}
