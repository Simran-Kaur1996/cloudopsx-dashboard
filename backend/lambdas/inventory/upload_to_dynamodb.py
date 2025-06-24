import boto3
import csv
import os
from decimal import Decimal
from botocore.exceptions import ClientError

# Initialize DynamoDB client
dynamodb = boto3.resource('dynamodb')
table_name = "cloudopsx-inventory"
table = dynamodb.Table(table_name)

# Path to CSV file
CSV_FILE_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../data/CloudOpsX_Inventory_Complex_Dataset.csv"))

def upload_csv_to_dynamodb():
    try:
        with open(CSV_FILE_PATH, newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            count = 0

            for row in reader:
                item = {
                    "product_id": row["product_id"],
                    "name": row["name"],
                    "brand": row["brand"],
                    "category": row["category"],
                    "price": Decimal(row["price"]),
                    "quantity": int(row["quantity"]),
                    "stock_status": row["stock_status"],
                    "supplier": row["supplier"],
                    "location": row["location"],
                    "reorder_level": int(row["reorder_level"]),
                    "last_updated": row["last_updated"]
                }

                table.put_item(Item=item)
                count += 1

            print(f"✅ Successfully uploaded {count} items to DynamoDB '{table_name}' table.")

    except FileNotFoundError:
        print(f"❌ CSV file not found at: {CSV_FILE_PATH}")
    except ClientError as e:
        print(f"❌ AWS ClientError: {e.response['Error']['Message']}")
    except Exception as ex:
        print(f"❌ Unexpected error: {str(ex)}")

if __name__ == "__main__":
    upload_csv_to_dynamodb()

# This script uploads data from a CSV file to a DynamoDB table.
# Ensure that the DynamoDB table exists and the CSV file path is correct before running.