variable "environment" {
  type    = "string"
  default = "test"
}

variable "s3_bucket_prefix" {
  #default = "my-tf-test-bucket-sam87"
  description = "prefix of s3 bucket"
  type        = "string"
}

variable "s3_region" {
  type = "string"
}

locals {
  s3_tags = {
    created_by  = "terraform"
    environment = "${var.environment}"
  }
}
