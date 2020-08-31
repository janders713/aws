data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/example.py"
  output_path = "${path.module}/lambda/example.zip"
}