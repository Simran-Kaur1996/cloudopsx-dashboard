# resource "aws_db_subnet_group" "rds_subnet_group" {
#   name       = "${var.project_name}-rds-subnet-group"
#   subnet_ids = [
#     aws_subnet.private_a.id,
#     aws_subnet.private_b.id
#   ]

#   tags = {
#     Name = "${var.project_name}-rds-subnet-group"
#   }
# }

# resource "aws_security_group" "rds_sg" {
#   name        = "${var.project_name}-rds-sg"
#   description = "Allow inbound PostgreSQL from EKS or Lambda"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port       = 5432
#     to_port         = 5432
#     protocol        = "tcp"
#     security_groups = [aws_security_group.eks_sg.id]  # Or replace with lambda SG
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.project_name}-rds-sg"
#   }
# }

# resource "aws_db_instance" "postgres" {
#   identifier             = "${var.project_name}-postgres"
#   engine                 = "postgres"
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   storage_encrypted      = true
#   username               = var.db_username
#   password               = var.db_password
#   db_name                = var.project_name
#   db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   publicly_accessible    = false
#   skip_final_snapshot    = true
#   deletion_protection    = false
#   backup_retention_period = 0
#   monitoring_interval     = 0
#   performance_insights_enabled = false

#   tags = {
#     Name        = "${var.project_name}-postgres"
#     Environment = "dev"
#   }
# }
