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
  cloud {
    organization = "ckhall-tf-bootcamp"

    workspaces {
      name = "terra-house-1"
    }
  }
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.terratowns_access_token
}

module "home1_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.user_uuid
  public_path = var.home1.public_path
  content_version = var.home1.content_version
}

resource "terratowns_home" "home1" {
  name = "My Home"
  description = "a home description"
  domain_name = module.home1_hosting.domain_name
  town = "missingo"
  content_version = var.home1.content_version
}

module "waterfall_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.user_uuid
  public_path = var.waterfall.public_path
  content_version = var.waterfall.content_version
}

resource "terratowns_home" "waterfall" {
  name = "Wonderful waterfall"
  description = "waterfalls"
  domain_name = module.waterfall_hosting.domain_name
  town = "the-nomad-pad"
  content_version = var.waterfall.content_version
}
