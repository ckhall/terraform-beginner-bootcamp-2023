terraform {
  cloud {
    organization = "ckhall-tf-bootcamp"

    workspaces {
      name = "terraform-cloud"
    }
  }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_path = var.index_html_path
  error_html_path = var.error_html_path
}
