terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "ckhall"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  #
  # cloud {
  #   organization = "ckhall-tf-bootcamp"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.terratowns_access_token
}

resource "terratowns_home" "home" {
  name = "My Home"
  description = "a home description"
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name = "asdlfoiwer.cloudfront.net"
  town = "missingo"
  content_version = 1
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
  content_version = var.content_version
  assets_path = var.assets_path
}
