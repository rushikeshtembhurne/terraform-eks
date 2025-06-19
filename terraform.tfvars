aws_region           = "us-east-1"
vpc_name             = "eks-vpc"
vpc_cidr             = "10.0.0.0/16"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_dns_hostnames = true
enable_dns_support   = true
enable_nat_gateway   = true
single_nat_gateway   = true
enable_irsa          = true
ami_type             = "AL2_x86_64"
instance_types       = ["t3.medium"]
min_size             = 2
max_size             = 6
desired_size         = 2
worker_mgmt_cidr_blocks = [
  "10.0.0.0/8",
  "172.16.0.0/12",
  "192.168.0.0/16"
]
egress_cidr_blocks = ["0.0.0.0/0"]