module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "$local.name"
  cidr = "${var.cidr}"

  azs = ["eu-west-1a","eu-west-1b"]
  #instra_subnets = "${var.instra_subnets["${terraform.workspace}"]}"
  #public_subnets = "${var.public.subnets["${terraform.workspace}"]}"

  tags {
    Environment = "${terraform.workspace}"
  }
}
