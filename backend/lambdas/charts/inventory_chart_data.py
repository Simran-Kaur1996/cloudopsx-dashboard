import boto3
from boto3.dynamodb.conditions import Key, Attr
from collections import defaultdict
import json
import os
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table("cloudopsx-inventory")

def handler(event, context):
    response = table.scan()
    items = response.get('Items', [])

    # Aggregate quantity per category
    category_totals = defaultdict(int)
    for item in items:
        category = item.get("category", "Unknown")
        quantity = int(item.get("quantity", 0))
        category_totals[category] += quantity

    # Format response
    return {
        "statusCode": 200,
        "body": json.dumps({
            "categories": list(category_totals.keys()),
            "quantities": list(category_totals.values())
        })
    }
