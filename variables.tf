variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "eu-west-2"
}

variable "domain_name" {
  description = "The domain name for the Route 53 zone."
}

variable "site_bucket_name" {
  description = "The name of the S3 bucket to host the static site."
}

variable "price_class" {
  description = "The price class for CloudFront distribution."
  default     = "PriceClass_100"
}
