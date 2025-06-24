module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.15.2"

  cluster_name    = "${var.project_name}-eks-cluster"
  cluster_version = "1.29"
  vpc_id          = aws_vpc.main.id
  subnet_ids      = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      instance_types = ["t3.medium"]
    }
  }

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::121955270316:user/simran-terraform"
      username = "terraform-user"
      groups   = ["system:masters"]
    }
  ]

  tags = {
    Project = var.project_name
  }
}
