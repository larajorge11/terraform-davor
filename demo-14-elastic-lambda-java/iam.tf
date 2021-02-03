data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda-vpc-role" {
  name               = "lambdaelastic"
  #assume_role_policy = data.aws_iam_policy_document.assume_role.json
  assume_role_policy = file(var.POLICY_LAMBDA_ASSUME_NAME)
}

data "aws_iam_policy_document" "network" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "network" {
  name   = "lambdaelastic-network"
  #policy = data.aws_iam_policy_document.network.json
  policy = file(var.POLICY_LAMBDA_NAME)
}

resource "aws_iam_policy_attachment" "network" {
  name       = "lambdaelastic-network"
  roles      = [aws_iam_role.lambda-vpc-role.name]
  policy_arn = aws_iam_policy.network.arn
}