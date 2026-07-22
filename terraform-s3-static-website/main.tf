# Create S3 Bucket
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name

  tags = {
    Name = "Terraform Static Website"
  }
}

# Allow Bucket Owner Control
resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Disable Public Access Block
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Enable Website Hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

# Public Read Bucket Policy
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid = "PublicRead"

        Effect = "Allow"

        Principal = "*"

        Action = [
          "s3:GetObject"
        ]

        Resource = [
          "${aws_s3_bucket.website.arn}/*"
        ]
      }
    ]
  })
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  source       = "./website/index.html"
  content_type = "text/html"
}

# Upload style.css
resource "aws_s3_object" "style" {
  bucket       = aws_s3_bucket.website.id
  key          = "style.css"
  source       = "./website/style.css"
  content_type = "text/css"
}

# Upload script.js
resource "aws_s3_object" "script" {
  bucket       = aws_s3_bucket.website.id
  key          = "script.js"
  source       = "./website/script.js"
  content_type = "application/javascript"
}
