# variable "aws_region" {
#   description = "AWS region for Client 1"
#   default     = "us-east-1"
# }

# variable "lambda_timeout" {
#   description = "Timeout for Client 1 Lambda function"
#   default     = 15
# }

# variable "client_1_lambda_name" {
#   description = "Name of the Lambda function for Client 1"
#   default     = "Client1LambdaFunction"
# }


variable "aws_region" {
  description = "AWS region for Client 1"
  default     = "ap-south-1"
}

variable "lambda_timeout" {
  description = "Timeout for Client 1 Lambda function"
  default     = 15
}

variable "client_1_lambda_name" {
  description = "Name of the Lambda function for Client 1"
  default     = "Client1LambdaFunction"
}

variable "client_1_s3_bucket_name" {
  description = "S3 bucket for Client 1 Lambda trigger"
  default     = "bucket1234sandon"
}

variable "client_1_s3_prefix" {
  description = "Prefix for S3 objects that trigger the Lambda for Client 1"
  default     = "uploads/"
}
