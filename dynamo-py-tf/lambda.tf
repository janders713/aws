
# Archive a single file.
locals {
  lambda_zip_location = "outputs/db.zip"
}



data "archive_file" "db" {
  type        = "zip"
  source_file = "db.py"
  output_path = local.lambda_zip_location
}



resource "aws_lambda_function" "test_lambda" {
  filename      = local.lambda_zip_location
  function_name = "db"
  role          = aws_iam_role.lambda_bd_role.id
  handler       = "db.start"

 #source_code_hash = filebase64sha256("local.lambda_zip_location")

  runtime = "python3.7"

}