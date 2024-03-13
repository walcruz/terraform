resource "aws_s3_bucket" "cloudfront-b" {
  for_each = toset(var.bucketName) 
  bucket = each.key
  acl    = "public-read-write"

  tags = {
    Name = each.key
  }
}

resource "aws_s3_bucket_policy" "cloudfront-b" {
  for_each = aws_s3_bucket.cloudfront-b
  bucket = each.key 
  policy = <<EOF
{
"Version": "2008-10-17",
"Statement": [
    {
        "Sid": "2",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${aws_cloudfront_origin_access_identity.s3_access.iam_arn}"
        },
        "Action": "s3:*",
        "Resource": "${each.value.arn}/*"
    }
  ]
}
EOF 
depends_on = [
    aws_cloudfront_origin_access_identity.s3_access,
    aws_s3_bucket.cloudfront-b,
  ]
}

resource "aws_cloudfront_origin_access_identity" "s3_access" {
  comment = "s3-cloudfront-b"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  dynamic "origin" {
        for_each = [for i in var.dynamic_s3_origin_config : {
          name          = i.domain_name
          id            = i.origin_id
          identity      = lookup(i, "origin_access_identity", null)
          path          = lookup(i, "origin_path", "")
        }]

        content {
          domain_name = origin.value.name
          origin_id   = origin.value.id
          origin_path = origin.value.path
          s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.s3_access.cloudfront_access_identity_path
          }
        }
      }
      
  dynamic "origin" {
      for_each = [for i in var.dynamic_custom_origin_config : {
        name                     = i.domain_name
        id                       = i.origin_id
        path                     = lookup(i, "origin_path", "")
      }]
      content {
        domain_name = origin.value.name
        origin_id   = origin.value.id
        origin_path = origin.value.path
        custom_origin_config {
          http_port                = "80"
          https_port               = "443"
          origin_keepalive_timeout = "5"
          origin_read_timeout      = "30"
          origin_protocol_policy   = "https-only"
          origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1"]
        }
      }
    }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.cfDescription
  default_root_object = var.defaultRoot

  aliases = ["${var.webname}${var.dot}${var.zonename}"]


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucketNameDefault

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  dynamic "ordered_cache_behavior" {
    for_each = var.behavior[*]
    iterator = w
    content {
      path_pattern     = w.value.folder
      allowed_methods  = ["GET", "HEAD", "OPTIONS"]
      cached_methods   = ["GET", "HEAD", "OPTIONS"]
      target_origin_id = w.value.destination

      forwarded_values {
        query_string = false
        headers      = ["Origin"]

        cookies {
          forward = "none"
        }
      }

      min_ttl                = 0
      default_ttl            = 86400
      max_ttl                = 31536000
      compress               = true
      viewer_protocol_policy = "redirect-to-https"
    }
  }
  

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = data.aws_acm_certificate.zoneCert.arn
    ssl_support_method = "sni-only"
  }
depends_on = [
    aws_cloudfront_origin_access_identity.s3_access,
    aws_s3_bucket.cloudfront-b,
    data.aws_acm_certificate.zoneCert
  ]
}
data "aws_route53_zone" "zone" {
  name         = var.zonename

}

data "aws_acm_certificate" "zoneCert" {
  provider = aws.certificates
  domain = "*.${var.zonename}"
}

resource "aws_route53_record" "cloudfront-b" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.webname
  type    = "CNAME"
  ttl     = "600"
  records = [aws_cloudfront_distribution.s3_distribution.domain_name]
} 