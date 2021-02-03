locals {
    lambda_function_name = "lambdaelastic"
    lambda_handler = "com.poc.csv.handler.InventoryRefresh"
}

resource "null_resource" "lambda_function" {
    provisioner "local-exec" {
        command = "pwd"
    }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id = "AllowS3Invoke"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_refresh.arn
  principal = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.main_bucket.arn
}

resource "aws_lambda_function" "lambda_refresh" {
  depends_on        = [ null_resource.lambda_function, aws_s3_bucket.javabucket ]
	function_name     = local.lambda_function_name
  s3_bucket         = aws_s3_bucket.javabucket.id
  s3_key            = aws_s3_bucket_object.s3_javacode_object.key
	handler           = local.lambda_handler
	runtime           = "java8"
	role              = aws_iam_role.lambda-vpc-role.arn
  memory_size       = 512
  timeout           = 10

  environment {
    variables = {
      "aws_access_key_id" = var.ACCESS_KEY
      "aws_secret_access_key" = var.SECRET_ACCESS_KEY
    }
  }
}