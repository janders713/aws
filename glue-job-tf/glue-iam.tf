resource "aws_iam_role_policy" "glue_policy" {
  name = "glue_policy"
  role = aws_iam_role.glue_role.id

  policy = file("iam/policy.json")

}

resource "aws_iam_role" "glue_role" {
  name = "glue_role"

  assume_role_policy = file("iam/assume-policy.json")

}