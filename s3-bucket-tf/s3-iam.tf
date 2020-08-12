resource "aws_iam_role_policy" "s3_policy" {
  name = "s3_policy"
  role = aws_iam_role.s3_role.id

  policy = file("iam/s3-policy.json")

}

resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = file("iam/s3-assume-policy.json")

}