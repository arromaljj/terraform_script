output "s3_bucket_website_url" {
  description = "The URL of the S3 bucket website."
  value       = aws_s3_bucket.nextjs_bucket.website_endpoint
}

output "cloudfront_distribution_domain" {
  description = "The domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.nextjs_distribution.domain_name
}