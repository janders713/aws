resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.basic-dynamodb-table
  hash_key   = UserId

  item = <<ITEM
{
  "exampleHashKey": {"S": "something"},
  "one": {"N": "11111"},
  "two": {"N": "22222"},
  "three": {"N": "33333"},
  "four": {"N": "44444"}
}
ITEM
}