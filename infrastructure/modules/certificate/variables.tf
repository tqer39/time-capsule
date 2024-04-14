variable "domain_name" {
  description = "*.プロダクト名.tld"
  type        = string
}

variable "zone_id" {
  description = "Route53 のゾーン ID"
  type        = string
}
