module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  enable_irsa     = var.enable_irsa
  tags = {
    cluster = "demo"
  }
  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type
    instance_types         = var.instance_types
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }
  eks_managed_node_groups = {

    node_group = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
    }
  }
}
