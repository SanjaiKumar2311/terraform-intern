# import json

# def lambda_handler(event, context):
#     return {
#         'statusCode': 200,
#         'body': json.dumps('Hello from Lambda!')
#     }





import json

def lambda_handler(event, context):
    # Parse S3 event notification
    for record in event['Records']:
        s3_bucket = record['s3']['bucket']['name']
        s3_key = record['s3']['object']['key']
        
        print(f"Processing file {s3_key} from bucket {s3_bucket}")
    
    return {
        'statusCode': 200,
        'body': json.dumps('File processed successfully!')
    }
