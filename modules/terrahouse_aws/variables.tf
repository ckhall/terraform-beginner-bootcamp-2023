variable "user_uuid" {
  description = "A user uuid"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "The input is not a valid UUID. Please provide a valid UUID."
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters, lowercase, and can only contain letters, numbers, hyphens, and periods. It can't start or end with a hyphen or period, and can't have consecutive hyphens or periods."
  }
}

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_path)
    error_message = "The specified index.html file path is invalid or does not exist."
  }
}

variable "error_html_path" {
  description = "Path to the error.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_path)
    error_message = "The specified error.html file path is invalid or does not exist."
  }
}


variable "content_version" {
  type        = number
  description = "Content version (a positive integer starting at 1)"
  default     = 1

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "Content version must be a positive integer."
  }
}