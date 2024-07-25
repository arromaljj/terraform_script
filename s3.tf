resource "aws_s3_bucket" "nextjs_bucket" {
  bucket = var.site_bucket_name
}

# resource "aws_s3_bucket_acl" "nextjs_bucket_acl" {
#   bucket = aws_s3_bucket.nextjs_bucket.id
#   acl    = "private"
# }

resource "aws_s3_bucket_public_access_block" "nextjs_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.nextjs_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "nextjs_bucket_policy" {
  bucket = aws_s3_bucket.nextjs_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.nextjs_bucket.arn}/*"

      },
    ]
  })
}
