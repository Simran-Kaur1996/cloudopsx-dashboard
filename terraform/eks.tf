# EKS Cluster IAM Role
# resource "aws_iam_role" "eks_cluster_role" {
#   name = "${var.project_name}-eks-cluster-role"

#   assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
# }

# Trust policy for EKS service to assume role
# data "aws_iam_policy_document" "eks_assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["eks.amazonaws.com"]
#     }
#   }
# }

# Attach EKS cluster policy to the IAM role
# resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attach" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks_cluster_role.name
# }

# EKS Cluster Resource (no managed node group to save cost)
# resource "aws_eks_cluster" "cluster" {
#   name     = "${var.project_name}-eks-cluster"
#   role_arn = aws_iam_role.eks_cluster_role.arn

#   vpc_config {
#     subnet_ids = [
#       aws_subnet.public_a.id,
#       aws_subnet.public_b.id
#     ]
#     endpoint_private_access = false    # Can be true if using private endpoints
#     endpoint_public_access  = true     # Required for Argo CD to communicate with EKS
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.eks_cluster_policy_attach
#   ]

#   tags = {
#     Name = "${var.project_name}-eks"
#   }
# }

# Security Group for EKS - NO public ingress to avoid IP dependency
# resource "aws_security_group" "eks_sg" {
#   name        = "${var.project_name}-eks-sg"
#   description = "Security group for EKS cluster"
#   vpc_id      = aws_vpc.main.id

#   # ❌ No ingress rule here (we're not using kubectl from laptop)
#   # ✅ Use this SG in RDS to allow internal EKS → RDS traffic

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.project_name}-eks-sg"
#   }
# }
