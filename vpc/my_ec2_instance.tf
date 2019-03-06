
resource "aws_launch_configuration" "myinstance" {
  name_prefix = "myinstance-"

  image_id = "ami-02a39bdb8e8ee056a"
  instance_type = "${var.bastion_intance_type}"
  key_name = "${aws_key_pair.bastion.key_name}"
  associate_public_ip_address = false
  enable_monitoring = false
  security_groups = ["${aws_security_group.bastion.id}"]
  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_autoscaling_group" "myinstance" {
  name = "myinstance-asg"
  min_size = 0
  desired_capacity = 1
  max_size = 1
  health_check_type = "EC2"
  launch_configuration = "${aws_launch_configuration.bastion.name}"
  vpc_zone_identifier = ["${aws_subnet.private.*.id}"]
}
