variable "s3_bucket_name" {
   #default = "my-tf-test-bucket-sam87"
   description = "name of s3 bucket"
   type = "string"
}

variable "s3_tags" {
  type = "map"
  default = {
      created_by = "terraform"
      environment = "test"
    }
}

variable "s3_regions" {
  type = "list"
  default = ["eu-west-1"]
}