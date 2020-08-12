resource "aws_s3_bucket" "JacobAnderson1996" {
    bucket = "JacobAnderson1996"
    acl = "private"
}


#uploading a file to the bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "JacobAnderson1996"
  key    = "MOCK_DATA"
  source = "C:/Users/Owner/Downloads/MOCK_DATA.csv"

}
