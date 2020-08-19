#creates role
resource "aws_iam_role" "AWSLAMBDA" {
  name = "AWSLAMBDA"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
#attaches role
resource "aws_iam_role_policy_attachment" "lambda" {
    role = aws_iam_role.AWSLAMBDA.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLAMBDA"
}

#policy for lambda

resource "aws_iam_role_policy" "my_lambda_policy" {
  name = "my_lambda_policy"
  role = aws_iam_role.AWSLAMBDA.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1597247587530",
      "Action": "logs:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#policy for db and attach it to lambda role
resource "aws_iam_role_policy" "my_db_policy" {
  name = "my_db_policy"
  role = aws_iam_role.AWSLAMBDA.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1597780862495",
      "Action": [
        "dynamodb:CreateTable",
        "dynamodb:DeleteItem",
        "dynamodb:DeleteTable",
        "dynamodb:GetItem",
        "dynamodb:ListTables",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:UpdateItem",
        "dynamodb:UpdateTable"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Archive a single file.
locals {
  lambda_zip_location = "outputs/welcome.zip"
}



data "archive_file" "welcome" {
  type        = "zip"
  source_file = "db.py"
  output_path = local.lambda_zip_location
}



resource "aws_lambda_function" "test_lambda" {
  filename      = local.lambda_zip_location
  function_name = "db"
  role          = aws_iam_role.AWSLAMBDA.id
  handler       = "db.start"

  #source_code_hash = filebase64sha256("local.lambda_zip_location")

  runtime = "python3.7"

}