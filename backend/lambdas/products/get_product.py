import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['INVENTORY_TABLE'])

def handler(event, context):
    try:
        product_id = event['pathParameters']['id']
        print(f"🔍 Looking up product_id: {product_id}")

        response = table.get_item(Key={"product_id": product_id})

        item = response.get("Item")
        if not item:
            return {
                "statusCode": 404,
                "body": json.dumps({"error": "Product not found"})
            }

        return {
            "statusCode": 200,
            "body": json.dumps(item)
        }

    except Exception as e:
        print("❌ ERROR:", str(e))
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
