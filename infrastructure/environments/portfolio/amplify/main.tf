module "domain" {
  source = "../../../modules/domain"

  domain_name = "time-capsule.tqer39.dev"
}

module "certificate" {
  source = "../../../modules/certificate"

  domain_name = "time-capsule.tqer39.dev"
  zone_id     = module.domain.zone_id
}
