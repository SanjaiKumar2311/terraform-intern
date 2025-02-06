# variable "aws_region" {
#   description = "AWS region for Client 2"
#   default     = "us-west-2"
# }

# variable "lambda_timeout" {
#   description = "Timeout for Client 2 Lambda function"
#   default     = 20
# }

# variable "client_2_lambda_name" {
#   description = "Name of the Lambda function for Client 2"
#   default     = "Client2LambdaFunction"
# }

variable "aws_region" {
  description = "AWS region for Client 2"
  default     = "ap-south-1"
}

variable "lambda_timeout" {
  description = "Timeout for Client 2 Lambda function"
  default     = 20
}

variable "client_2_lambda_name" {
  description = "Name of the Lambda function for Client 2"
  default     = "Client2LambdaFunction"
}

variable "client_2_s3_bucket_name" {
  description = "S3 bucket for Client 2 Lambda trigger"
  default     = "client-2-bucket"
}

variable "client_2_s3_prefix" {
  description = "Prefix for S3 objects that trigger the Lambda for Client 2"
  default     = "files/"
}
