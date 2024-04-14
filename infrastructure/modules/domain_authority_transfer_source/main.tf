/*
 * # Usage
 *
 * ## Abstract
 *
 * - ドメインの権限移譲元の設定
 */

resource "aws_route53_zone" "this" {
  count = var.is_production ? 0 : 1

  name = var.domain_name
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "this" {
  count = var.is_production ? 1 : 0
  name  = "${var.domain_name}."
}

module "certificate" {
  source = "../certificate"

  count = var.require_certificate ? 1 : 0

  domain_name = var.domain_name
  zone_id     = aws_route53_zone.this[0].zone_id
}

module "dev_domain" {
  source = "../../modules/route53/record/ns"

  count = length(var.dev_name_servers) == 0 ? 0 : 1

  zone_id         = data.aws_route53_zone.this[0].zone_id
  name            = var.dev_domain_name
  allow_overwrite = true
  ttl             = 300
  records         = var.dev_name_servers
  depends_on = [
    data.aws_route53_zone.this[0]
  ]
}
