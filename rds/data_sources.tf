# Remote state - All the "output" from other deployments are registred here, so we can use them as an input
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "sam-terraform-deployment-eu-west-1"
    key = "deployment/vpc"
    region = "eu-west-1"
  }
}
