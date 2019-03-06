resource "random_string" "db_password" {

  length = 24
  lower = true
  upper = true
  number = true
  special = false

}

resource "aws_ssm_parameter" "db_password" {
  name = "/${var.environment}/db/terraform/admin"
  description = "admin password for ${var.db_name}"
  type = "SecureSctring"
  value = "${random_string.db_password.result}"    
}
