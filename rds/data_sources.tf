data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "sam-terraform-test-eu-west-1"
    key = "test/vpc"
    region = "eu-west-1"
  }
}
