
resource "aws_s3_bucket" "davorbucket" {
  bucket = var.s3_bucket
  acl = "private"
  
  tags = {
    Name = "davorbucket"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_object" "zipfile" {
  bucket = aws_s3_bucket.davorbucket.id
  key = "my-key-davor-bianca/demo19890806.zip"
  content_type = "application/zip"
  acl = "private"
  source = "demo19890806.zip"
  etag = filemd5("demo19890806.zip")
}