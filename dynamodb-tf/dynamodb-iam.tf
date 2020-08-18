resource "aws_iam_role_policy" "db-policy" {
  name = "db_policy"
  role = aws_iam_role.db_role.id

  policy = file("iam/dynamodb-policy.json")

}

resource "aws_iam_role" "db_role" {
  name = "db_role"

  assume_role_policy = file("iam/dynamo-assume-policy.json")

}