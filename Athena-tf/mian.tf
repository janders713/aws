#creates role
resource "aws_iam_role" "glue" {
  name = "AWSGlueServiceRoleDefault"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#attaches role
resource "aws_iam_role_policy_attachment" "glue_service" {
    role = aws_iam_role.glue.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

#policy for s3 and attach it to glue role
resource "aws_iam_role_policy" "my_s3_policy" {
  name = "my_s3_policy"
  role = aws_iam_role.glue.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::jacob713-bucket",
        "arn:aws:s3:::jacob713-bucket/*"
      ]
    }
  ]
}
EOF
}

#create Athena database
resource "aws_s3_bucket" "mybucket" {
  bucket = "jacob713-bucket"
}

resource "aws_athena_database" "athena-db" {
  name   = "athena-db"
  bucket = aws_s3_bucket.mybucket.bucket
}

#glue catalog database
resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = "MyCatalogDatabase"
}

#runs crawler on s3 bucket
resource "aws_glue_crawler" "crawler2" {
  database_name = "athena-db"
  name          = "crawler2"
  role          = aws_iam_role.glue.id

  s3_target {
    path = "s3://jacob713-bucket/MOCK_DATA.csv"
  }
}