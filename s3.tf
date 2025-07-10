# It will create a random suffix for the S3 bucket name to ensure uniqueness.
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# This Terraform configuration sets up an S3 bucket to host a static website.
resource "aws_s3_bucket" "static_website" {
  bucket = "trfm-static-web-host-${random_id.bucket_suffix.hex}"
}

# This block configures the S3 bucket to allow public access.
resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# This block sets the bucket policy to allow public read access to the objects in the S3 bucket.
resource "aws_s3_bucket_policy" "static_website_public_read" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}

# This block configures the S3 bucket to serve as a static website by taking the index and error documents.
resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

# This block uploads the index.html file to the S3 bucket, setting its content type to text/html.
# The etag is calculated using the MD5 hash of the file to ensure integrity.
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}

# This block uploads the error.html file to the S3 bucket, setting its content type to text/html.
# The etag is calculated using the MD5 hash of the file to ensure integrity.
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "error.html"
  source       = "build/error.html"
  etag         = filemd5("build/error.html")
  content_type = "text/html"
}
