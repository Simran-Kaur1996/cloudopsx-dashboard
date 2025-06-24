resource "aws_lambda_function" "create_product" {
  function_name = "${var.project_name}-create-product"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "create_product.handler"
  runtime       = "python3.11"
  filename      = "${path.module}/../backend/lambdas/products/create_product.zip"
  timeout       = 10
  environment {
    variables = {
      INVENTORY_TABLE = aws_dynamodb_table.inventory.name
    }
  }
}
resource "aws_lambda_function" "get_product" {
  function_name = "${var.project_name}-get-product"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "get_product.handler"
  runtime       = "python3.11"

  filename      = "${path.module}/../backend/lambdas/products/get_product.zip"
  timeout       = 10

  environment {
    variables = {
      INVENTORY_TABLE = aws_dynamodb_table.inventory.name
    }
  }

  tags = {
    Project = var.project_name
  }
}
resource "aws_lambda_function" "inventory_chart_data" {
  function_name = "${var.project_name}-inventory-chart-data"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "inventory_chart_data.handler"
  runtime       = "python3.11"
  filename      = "${path.module}/../backend/lambdas/charts/inventory_chart_data.zip"
  timeout       = 10

  environment {
    variables = {
      INVENTORY_TABLE = aws_dynamodb_table.inventory.name
    }
  }
}
resource "aws_lambda_function" "get_inventory_chart_data" {
  function_name = "${var.project_name}-get-inventory-chart-data"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "inventory_chart_data.handler"  # ✅ double check your .py file
  runtime       = "python3.11"
  filename      = "${path.module}/../backend/lambdas/charts/inventory_chart_data.zip"
  timeout       = 10
  memory_size   = 128

  source_code_hash = filebase64sha256("${path.module}/../backend/lambdas/charts/inventory_chart_data.zip")

  environment {
    variables = {
      INVENTORY_TABLE = aws_dynamodb_table.inventory.name
    }
  }
}
