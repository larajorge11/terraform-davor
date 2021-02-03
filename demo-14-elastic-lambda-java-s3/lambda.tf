locals {
    lambda_function_name = "lambdaelastic"
    lambda_handler = "com.poc.csv.handler.InventoryRefresh"
}

resource "null_resource" "lambda_function" {
    provisioner "local-exec" {
        command = "pwd"
    }
}

resource "aws_lambda_function" "demo_lambda_redis" {
  depends_on        = [ null_resource.lambda_function, aws_s3_bucket.javabucket ]
	function_name     = local.lambda_function_name
  s3_bucket         = aws_s3_bucket.javabucket.id
  s3_key            = aws_s3_bucket_object.s3_javacode_object.key
	handler           = local.lambda_handler
	runtime           = "java8"
	role              = aws_iam_role.lambda-vpc-role.arn

  vpc_config {
    subnet_ids          = [ aws_subnet.main-private-1.id ]
    security_group_ids  = [ aws_security_group.elastic_connection.id ]
  }

  environment {
    variables = {
      "REDIS_HOST" = "${aws_elasticache_cluster.davorredis.cache_nodes.0.address}"
      "REDIS_PORT" = "${aws_elasticache_cluster.davorredis.cache_nodes.0.port}"
    }
  }
}
