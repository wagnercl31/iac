resource "aws_s3_bucket" "builders01-bucket" {
  bucket = "builders01-bucket"
  acl    = "private"
}
