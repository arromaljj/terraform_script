resource "aws_acm_certificate" "nextjs_cert" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "nextjs_cert_validation" {
  provider          = aws.us_east_1
  for_each = {
    for dvo in aws_acm_certificate.nextjs_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = aws_route53_zone.nextjs_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "nextjs_cert_validation" {
      provider          = aws.us_east_1
  certificate_arn         = aws_acm_certificate.nextjs_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.nextjs_cert_validation : record.fqdn]
}