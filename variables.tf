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
    condition = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters, lowercase, and can only contain letters, numbers, hyphens, and periods. It can't start or end with a hyphen or period, and can't have consecutive hyphens or periods."
  }
}
