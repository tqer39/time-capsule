output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "The ID of the Route 53 Hosted Zone."
}
