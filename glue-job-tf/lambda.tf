# Archive a single file.
locals {
  lambda_zip_location = "outputs/glue-job.zip"
}



data "archive_file" "welcome" {
  type        = "zip"
  source_file = "glue-job.py"
  output_path = local.lambda_zip_location
}



resource "aws_lambda_function" "glue-job" {
  filename      = local.lambda_zip_location
  function_name = "glue-job"
  role          = aws_iam_role.glue_role.id
  handler       = "glue-job.lambda_handler"

  #source_code_hash = filebase64sha256("local.lambda_zip_location")

  runtime = "python3.7"

}