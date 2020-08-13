# Archive a single file.
locals {
  lambda_zip_location = "outputs/date.zip"
}



data "archive_file" "welcome" {
  type        = "zip"
  source_file = "date.py"
  output_path = local.lambda_zip_location
}



resource "aws_lambda_function" "test_lambda" {
  filename      = local.lambda_zip_location
  function_name = "date"
  role          = aws_iam_role.new_lambda_role.arn
  handler       = "date.date_conv"

  #source_code_hash = filebase64sha256("local.lambda_zip_location")

  runtime = "python3.7"

}