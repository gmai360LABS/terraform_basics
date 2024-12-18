resource "aws_db_instance" "example" {
  identifier_prefix = "gmai360labs-db-instance"
  db_name = "gmai360labs_database"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  skip_final_snapshot = true
  allocated_storage = 10
  parameter_group_name = "default.mysql8.0"
  username = var.db_username
  password = var.db_password
}