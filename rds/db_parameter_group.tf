resource "aws_db_parameter_group" "default" {
  name = "${var.db_name}"
  family = "postgres"

  parameter {
    name = "log_statement"
    value = "all"
  }

  parameter {
    name = "log_min_duration_statment"
    value = "1000"
  }

  tags {
    "Name" = "param group for ${var.db_name}"
  }

}
