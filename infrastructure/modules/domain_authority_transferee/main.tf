/*
 * # Usage
 *
 * ## Abstract
 *
 * - ドメインの権限移譲先の設定
 */

resource "aws_route53_zone" "this" {
  name = var.domain_name
  lifecycle {
    create_before_destroy = true
  }
}

module "dev_domain" {
  source = "../../modules/route53/record/ns"

  count = length(var.dev_name_servers) == 0 ? 0 : 1

  zone_id         = aws_route53_zone.this.zone_id
  name            = var.dev_domain_name
  ttl             = var.ttl
  records         = var.dev_name_servers
  allow_overwrite = var.allow_overwrite
  depends_on = [
    aws_route53_zone.this
  ]
}
