
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
  key = "my-key-davor-bianca/HandlerRequestObj-1.0.0-SNAPSHOT.zip"
  content_type = "application/zip"
  acl = "private"
  source = "HandlerRequestObj-1.0.0-SNAPSHOT.zip"
  etag = filemd5("HandlerRequestObj-1.0.0-SNAPSHOT.zip")
}