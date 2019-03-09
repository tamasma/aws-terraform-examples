locals {
  name = "${terraform.workspace}-workspace"
}

variable "cidr" {
  type = "string"
  default = "10.0.0.1/16"
}


variable "region" {
  type = "map"
  default  {
    prod = "eu-west-1"
    dev = "eu-west-1"
  }
}

variable "pubic_subnets" {
  type = "map"
  default {
    prod = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    dev = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  }
}
