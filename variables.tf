variable "user_uuid" {
  type = string
}

variable "terratowns_endpoint" {
  type = string
}

variable "terratowns_access_token" {
  type = string
}

# variable "bucket_name" {
#   type = string
# }

variable "home1" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "waterfall" {
  type = object({
    public_path = string
    content_version = string
  })
}
