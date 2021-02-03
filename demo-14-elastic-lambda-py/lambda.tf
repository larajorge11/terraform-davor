resource "null_resource" "lambda_function" {
    provisioner "local-exec" {
        command = "pwd"
    }
}

resource "aws_lambda_function" "demo_lambda_redis" {
  depends_on = [ null_resource.lambda_function ]
	function_name    = "lambdaelastic"
	handler          = "index.handler"
	runtime          = "nodejs12.x"
	filename         = "demo-lambda-redis.zip"
    source_code_hash = filebase64sha256("demo-lambda-redis.zip")
	role             = aws_iam_role.lambda-vpc-role.arn

  vpc_config {
    subnet_ids          = [ aws_subnet.main-private-1.id ]
    security_group_ids  = [ aws_security_group.elastic_connection.id ]
  }

  environment {
    variables = {
      "REDIS_URL" = "redis://${aws_elasticache_cluster.davorredis.cache_nodes.0.address}:${aws_elasticache_cluster.davorredis.cache_nodes.0.port}"
    }
  }
}