# variable "aws_region" {
#   description = "AWS region for deployment"
#   default     = "us-east-1"
# }

# variable "lambda_runtime" {
#   description = "Runtime environment for Lambda"
#   default     = "python3.9"
# }

# variable "lambda_timeout" {
#   description = "Timeout for Lambda function in seconds"
#   default     = 10
# }



variable "aws_region" {
  description = "AWS region for deployment"
  default     = "ap-south-1"
}

variable "lambda_runtime" {
  description = "Runtime environment for Lambda"
  default     = "python3.9"
}

variable "lambda_timeout" {
  description = "Timeout for Lambda function in seconds"
  default     = 10
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
}

# Variables for S3 configuration
variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
}

variable "s3_prefix" {
  description = "The prefix for S3 objects that will trigger the Lambda"
  default     = ""
}
