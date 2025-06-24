resource "aws_dynamodb_table" "inventory" {
  name           = "${var.project_name}-inventory"
  billing_mode   = "PAY_PER_REQUEST"  # cost-effective, serverless
  hash_key       = "product_id"

  attribute {
    name = "product_id"
    type = "S"
  }

  tags = {
    Name = "${var.project_name}-inventory"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "stock_metrics" {
  name           = "StockMetrics"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "SKU"

  attribute {
    name = "SKU"
    type = "S"
  }

  tags = {
    Name = "StockMetrics"
  }
}