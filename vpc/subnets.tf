resource "aws_subnet" "public" {
  # count     = "${length(var.availability_zones)}"
  vpc_id    = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.cidr_block, 8, 1)}"
  availability_zone = "${var.availability_zones}"
  # availability_zone = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = true

  tags {
    "Name" = "Public Subnet - ${var.availability_zones}"
    # "Name" = "Public Subnet - ${element(var.availability_zones, count.index)}"
  }
}
resource "aws_subnet" "private" {
  count     = "1"
  # count     = "${length(var.availability_zones)}"
  vpc_id    = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.cidr_block, 8, 2)}"
  availability_zone = "${var.availability_zones}"
  # availability_zone = "${element(var.availability_zones, count.index)}"

  map_public_ip_on_launch = false

  tags {
    "Name" = "Privat Subnet - ${var.availability_zones}"
    # "Name" = "Public Subnet - ${element(var.availability_zones, count.index)}"
  }
}
#
resource "aws_eip" "nat" {
  # count     = "${length(var.availability_zones)}"
  vpc = true
}
#
resource "aws_nat_gateway" "main" {

  # count     = "${length(var.availability_zones)}"
  subnet_id = "${aws_subnet.public.id}"
  # subnet_id = "${aws.subnet.public.*.id, count.index)}"
  allocation_id = "${aws_eip.nat.id}"
  # allocation_id = "${aws.eip.nat.*.id, count.index)}"

  tags {
    "Name " = "NAT - ${var.availability_zones}"
  }


}
