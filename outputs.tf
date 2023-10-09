output "bucket_name" {
  description = "bucket name for our static website hosting"
  value = module.home1_hosting.bucket_name
}

output "website_endpoint" {
  description = "website endpoint"
  value = module.home1_hosting.website_endpoint
}

output "domain_name" {
  description = "cloudfront domain name"
  value = module.home1_hosting.domain_name
}
