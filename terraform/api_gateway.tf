resource "aws_api_gateway_rest_api" "cloudopsx_api" {
  name = "${var.project_name}-api"
}

resource "aws_api_gateway_resource" "products" {
  rest_api_id = aws_api_gateway_rest_api.cloudopsx_api.id
  parent_id   = aws_api_gateway_rest_api.cloudopsx_api.root_resource_id
  path_part   = "products"
}

resource "aws_api_gateway_method" "post_product" {
  rest_api_id   = aws_api_gateway_rest_api.cloudopsx_api.id
  resource_id   = aws_api_gateway_resource.products.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_post_product" {
  rest_api_id             = aws_api_gateway_rest_api.cloudopsx_api.id
  resource_id             = aws_api_gateway_resource.products.id
  http_method             = aws_api_gateway_method.post_product.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.create_product.invoke_arn
}

resource "aws_lambda_permission" "apigw_invoke_create_product" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_product.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.cloudopsx_api.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_post_product]
  rest_api_id = aws_api_gateway_rest_api.cloudopsx_api.id
   description = "Deployment for dev stage"
}
resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.cloudopsx_api.id
  stage_name    = "dev"
}
resource "aws_api_gateway_resource" "charts" {
  rest_api_id = aws_api_gateway_rest_api.cloudopsx_api.id
  parent_id   = aws_api_gateway_rest_api.cloudopsx_api.root_resource_id
  path_part   = "charts"
}

resource "aws_api_gateway_resource" "inventory_chart" {
  rest_api_id = aws_api_gateway_rest_api.cloudopsx_api.id
  parent_id   = aws_api_gateway_resource.charts.id
  path_part   = "inventory"
}
resource "aws_api_gateway_method" "get_inventory_chart" {
  rest_api_id   = aws_api_gateway_rest_api.cloudopsx_api.id
  resource_id   = aws_api_gateway_resource.inventory_chart.id
  http_method   = "GET"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "lambda_get_inventory_chart" {
  rest_api_id             = aws_api_gateway_rest_api.cloudopsx_api.id
  resource_id             = aws_api_gateway_resource.inventory_chart.id
  http_method             = aws_api_gateway_method.get_inventory_chart.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.get_inventory_chart_data.invoke_arn
}
resource "aws_lambda_permission" "apigw_invoke_get_inventory_chart" {
  statement_id  = "AllowAPIGatewayInvokeChart"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_inventory_chart_data.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.cloudopsx_api.execution_arn}/*/*"
}
resource "aws_api_gateway_deployment" "deployment_charts" {
  depends_on  = [aws_api_gateway_integration.lambda_get_inventory_chart, aws_api_gateway_method.get_inventory_chart]
  rest_api_id = aws_api_gateway_rest_api.cloudopsx_api.id
  description = "Deployment for charts stage"
}