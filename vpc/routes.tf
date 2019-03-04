resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    "Name" = "Public route table"
  }

}
#
resource "aws_route" "public_internet_gateway" {
  route_table_id      = "${aws_route_table.public.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id          = "${aws_internet_gateway.main.id}"
}
#
resource "aws_route_table_association" "public" {
  # count = "${length(var.availability_zones)}"
  subnet_id = "${aws_subnet.public.id}"
  # subnet_id = "${element(aws.subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"

}
#
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    "Name" = "Privat route table"
  }

}

resource "aws_route" "nat_gateway" {
  # count = "${length(var.availability_zones)}"
  route_table_id      = "${aws_route_table.private.id}"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id      = "${aws_nat_gateway.main.id}"
}
#
resource "aws_route_table_association" "private" {

  # count = "${length(var.availability_zones)}"
  subnet_id = "${aws_subnet.private.id}"
  # subnet_id = "${element(aws.subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"

}
