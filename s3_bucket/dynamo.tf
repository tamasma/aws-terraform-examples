resource "aws_dynamodb_table" "lock" {

  name = "terraform-lock"
  read_capacity = 1
  write_capacity = 1
  hash_key = "LockID"

  #mandatory primary key ---> named "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}
