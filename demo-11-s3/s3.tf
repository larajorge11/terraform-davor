locals {
  csv_name_file = "Zemoga_investor_insights_inventory_data.csv"
}

resource "aws_s3_bucket" "davorbucket" {
  bucket = var.BUCKET_NAME
  acl = "private"
  
  tags = {
    Name = "davorbucket"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_object" "csvfile" {
  bucket = aws_s3_bucket.davorbucket.id
  key = "csv/Zemoga_investor_insights_inventory_data.csv"
  acl = "private"
  content_type = "csv"
  source = local.csv_name_file
  etag = filemd5(local.csv_name_file)
}