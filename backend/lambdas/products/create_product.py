import json
import boto3
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['INVENTORY_TABLE'])

def handler(event, context):
    try:
        # Log full event to CloudWatch
        print("🔍 Full event received:", json.dumps(event))

        # Parse body safely
        body = json.loads(event.get('body', '{}'))
        product_id = body.get("product_id")
        name = body.get("name")
        quantity = body.get("quantity")

        print(f"Parsed values → product_id: {product_id}, name: {name}, quantity: {quantity}")

        if not product_id or not name or quantity is None:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Missing product_id, name, or quantity"})
            }

        table.put_item(Item={
            "product_id": product_id,
            "name": name,
            "quantity": quantity
        })

        return {
            "statusCode": 200,
            "body": json.dumps({"message": f"✅ Product '{name}' created!"})
        }

    except Exception as e:
        print("❌ Error:", str(e))
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
