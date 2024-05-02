resource "aws_db_instance" "mysql_instance" {
  identifier            = "my-mysql-db"
  allocated_storage     = 5
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t3.micro"
  db_name               = "mydatabase"
  username              = "admin"
  password              = "mypassword"
  skip_final_snapshot   = true
  publicly_accessible   = true
  vpc_security_group_ids = ["sg-0224dc99c56c3ef39"]
}
