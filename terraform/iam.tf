
#  Goal: Create all required IAM roles and policies 
# for Lambda, API Gateway, RDS, Cognito, and EKS nodes.
# We’ll define:

# lambda_execution_role – To allow Lambda to access logs, DynamoDB, RDS

# api_gateway_role – To let API Gateway invoke Lambda

# rds_access_policy – For Lambda to access RDS securely

# dynamodb_access_policy – For Lambda to read/write to tables

# cognito_role – For authenticated user access
# ==============================
# IAM Role for Lambda Execution
# ==============================
resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "lambda_basic_exec_attach" {
  name       = "${var.project_name}-lambda-basic"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles      = [aws_iam_role.lambda_execution_role.name]
}

# Grant Lambda access to DynamoDB
resource "aws_iam_policy" "dynamodb_access" {
  name = "${var.project_name}-lambda-dynamodb-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem",
        "dynamodb:Scan",
        "dynamodb:Query"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_iam_policy_attachment" "lambda_dynamodb_policy_attach" {
  name       = "${var.project_name}-lambda-dynamo"
  policy_arn = aws_iam_policy.dynamodb_access.arn
  roles      = [aws_iam_role.lambda_execution_role.name]
}

# Grant Lambda access to RDS (via Secrets Manager or IAM DB auth)
resource "aws_iam_policy" "rds_access" {
  name = "${var.project_name}-lambda-rds-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "rds:DescribeDBInstances",
        "rds:Connect"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_iam_policy_attachment" "lambda_rds_policy_attach" {
  name       = "${var.project_name}-lambda-rds"
  policy_arn = aws_iam_policy.rds_access.arn
  roles      = [aws_iam_role.lambda_execution_role.name]
}

# ====================================
# IAM Role for API Gateway to Invoke Lambda
# ====================================
resource "aws_iam_role" "apigateway_invoke_lambda" {
  name = "${var.project_name}-apigw-invoke-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "apigateway.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "apigateway_invoke_policy" {
  name = "${var.project_name}-apigw-invoke-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "lambda:InvokeFunction"
      Resource = "*"
    }]
  })
}

resource "aws_iam_policy_attachment" "apigw_policy_attach" {
  name       = "${var.project_name}-apigw-attach"
  policy_arn = aws_iam_policy.apigateway_invoke_policy.arn
  roles      = [aws_iam_role.apigateway_invoke_lambda.name]
}

# # ====================================
# # IAM Role for Cognito Authenticated Users
# # ====================================
# resource "aws_iam_role" "cognito_authenticated_role" {
#   name = "${var.project_name}-cognito-auth-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect = "Allow"
#       Principal = {
#         Federated = "cognito-identity.amazonaws.com"
#       }
#       Action = "sts:AssumeRoleWithWebIdentity"
#       Condition = {
#         StringEquals = {
#           "cognito-identity.amazonaws.com:aud" = var.cognito_identity_pool_id
#         }
#         "ForAnyValue:StringLike" = {
#           "cognito-identity.amazonaws.com:amr" = "authenticated"
#         }
#       }
#     }]
#   })
# }

# resource "aws_iam_policy" "cognito_access_policy" {
#   name = "${var.project_name}-cognito-access"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect   = "Allow"
#       Action   = [
#         "mobileanalytics:PutEvents",
#         "cognito-sync:*",
#         "cognito-identity:*"
#       ]
#       Resource = "*"
#     }]
#   })
# }

# resource "aws_iam_policy_attachment" "cognito_policy_attach" {
#   name       = "${var.project_name}-cognito-attach"
#   policy_arn = aws_iam_policy.cognito_access_policy.arn
#   roles      = [aws_iam_role.cognito_authenticated_role.name]
# }
