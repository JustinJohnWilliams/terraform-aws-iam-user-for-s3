variable "user_name" {
  type        = string
  description = "IAM username to create."
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name the user can read from."
}

variable "force_destroy" {
  type        = bool
  description = "Delete user even if it has access keys/policies."
  default     = true
}

variable "path" {
  type        = string
  description = "IAM path for the user."
  default     = "/"
}
