# provider "aws" {
#   region = var.aws_region
# }

# # IAM Role for Lambda (Common for Both Clients)
# resource "aws_iam_role" "lambda_role" {
#   name = "lambda_execution_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = "lambda.amazonaws.com"
#       }
#     }]
#   })
# }

# # Attach Policy for CloudWatch Logging (Common Policy)
# resource "aws_iam_policy_attachment" "lambda_policy" {
#   name       = "lambda_basic_execution_policy"
#   roles      = [aws_iam_role.lambda_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }

# # Archive the Lambda Function (Zip the Python Code)
# data "archive_file" "lambda_zip" {
#   type        = "zip"
#   source_file = "lambda_function.py"
#   output_path = "lambda_function.zip"
# }






provider "aws" {
  region = var.aws_region
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

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

# Attach Policy for CloudWatch Logging
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Archive the Lambda Function
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"  # Ensure this path is correct
  output_path = "${path.module}/lambda_function.zip"
}

# Create Lambda Function
resource "aws_lambda_function" "lambda_function" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = var.lambda_runtime
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  timeout          = var.lambda_timeout
}

# Create S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name  
}

# Ensure S3 Bucket is Private
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = true
  ignore_public_acls  = true
  block_public_policy = true
  restrict_public_buckets = true
}

# S3 Trigger for Lambda
resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = aws_s3_bucket.bucket.id

  lambda_function {
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.s3_prefix
    lambda_function_arn = aws_lambda_function.lambda_function.arn
  }
}

# Permission for Lambda to be triggered by S3
resource "aws_lambda_permission" "s3_lambda_permission" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn
}

