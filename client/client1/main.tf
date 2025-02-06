# module "lambda_client_1" {
#   source               = "../../lambda"
#   lambda_function_name = var.client_1_lambda_name
#   lambda_timeout       = var.lambda_timeout
#   aws_region           = var.aws_region
# }


module "lambda_client_1" {
  source               = "../../lambda"
  lambda_function_name = var.client_1_lambda_name
  lambda_timeout       = var.lambda_timeout
  aws_region           = var.aws_region
  s3_bucket_name       = var.client_1_s3_bucket_name
  s3_prefix            = var.client_1_s3_prefix
}





