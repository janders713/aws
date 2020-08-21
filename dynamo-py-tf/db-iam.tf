resource "aws_iam_role_policy" "lam_policy" {
  name = "lam_policy"


  policy = file("iam/lambda-policy.json")

  role = aws_iam_role.lambda_bd_role.id
}
resource "aws_iam_role_policy" "db_policy" {
  name = "db_policy"


  policy = file("iam/db-policy.json")

  role = aws_iam_role.lambda_bd_role.id
}

resource "aws_iam_role" "lambda_bd_role" {
  name = "lambda_db_role"

  assume_role_policy = file("iam/db-assume-policy.json")

}