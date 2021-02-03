locals {
    lambda_zip_function = "demo-1.0.0.zip"
}

#data "archive_file" "hellolambda" {
#  type        = "zip"
#  source_file = "demo-1.0.0.jar"
#  output_path = local.lambda_zip_function
#}

resource "aws_lambda_function" "string_lambda" {
  filename = local.lambda_zip_function
  source_code_hash = filebase64sha256(local.lambda_zip_function)
  function_name = "HandlerString"
  role = aws_iam_role.lambda_role.arn
  handler = "com.amazonaws.lambda.demo.Hello"
  description = "Lambda Function Java for Strings"
  runtime = "java8"
  memory_size = 512
  timeout = 10

  environment {
    variables = {
      REGION = var.AWS_REGION
    }
  }
}