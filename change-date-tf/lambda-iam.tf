resource "aws_iam_role_policy" "new_lambda_policy" {
  name = "new_lambda_policy"
  role = aws_iam_role.new_lambda_role.id

  policy = file("iam/lambda-policy.json")

}

resource "aws_iam_role" "new_lambda_role" {
  name = "new_lambda_role"

  assume_role_policy = file("iam/lambda-assume-policy.json")

}