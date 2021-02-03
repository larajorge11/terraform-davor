resource "aws_lambda_function" "string_lambda" {
  s3_bucket = aws_s3_bucket.davorbucket.id
  s3_key = aws_s3_bucket_object.zipfile.key
  function_name = "HandlerString"
  role = aws_iam_role.lambda_role.arn
  handler = "com.amazonaws.lambda.demo.Hello"
  description = "Lambda Function Java for Strings"
  runtime = "java8"
  memory_size = 512
  timeout = 10

  depends_on = [ aws_s3_bucket.davorbucket ]
}