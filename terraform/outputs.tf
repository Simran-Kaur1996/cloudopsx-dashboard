# output "eks_cluster_name" {
#   value = aws_eks_cluster.cluster.name
# }

# output "eks_cluster_endpoint" {
#   value = aws_eks_cluster.cluster.endpoint
# }

output "dynamodb_inventory_table_name" {
  value = aws_dynamodb_table.inventory.name
}

# output "api_url" {
#   value = "${aws_api_gateway_deployment.deployment.invoke_url}/products"
# }
output "api_url" {
  value = "https://${aws_api_gateway_rest_api.cloudopsx_api.id}.execute-api.us-east-1.amazonaws.com/dev/products"
}
