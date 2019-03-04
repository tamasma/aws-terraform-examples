variable "environment" {
  type    = "string"
  default = "test"
}

variable "availability_zones" {
  type    = "string"
}

variable "region" {
  type = "string"
}

variable "bastion_intance_type" {
  type = "string"
}

variable "cidr_block" {
  type = "string"
  description = "VPC cidr block "
}
