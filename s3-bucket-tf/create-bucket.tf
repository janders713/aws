resource "aws_s3_bucket" "tf_course" {
    bucket = "JacobAnderson1996"
    acl = "private"
}


#uploading a file to the bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "tf_course"
  key    = "MOCK_DATA"
  source = "C:/Users/Owner/Downloads/MOCK_DATA.csv"

}