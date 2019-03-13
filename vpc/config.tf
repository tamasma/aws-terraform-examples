provider "aws" {
  region = "${var.region}"
  version = "2.0"
}

terraform {
  required_version = "> 0.11"
  backend "s3"{
    bucket = "sam-terraform-test-eu-west-1"
    key = "test/vpc"

    region = "eu-west-1"
    encrypt = "true"
    profile = "dev"
    dynamodb_table = "terraform-lock"
  }
}
