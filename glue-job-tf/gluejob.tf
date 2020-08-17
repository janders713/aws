resource "aws_glue_job" "testJob" {
  name     = "example"
  role_arn = aws_iam_role.glue_role.id

  command {
    script_location = "s3://${JacobAnderson1996}/glue-job.py"
  }
}