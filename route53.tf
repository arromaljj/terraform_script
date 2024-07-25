resource "aws_route53_zone" "nextjs_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "nextjs_record" {
  zone_id = aws_route53_zone.nextjs_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.nextjs_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.nextjs_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}