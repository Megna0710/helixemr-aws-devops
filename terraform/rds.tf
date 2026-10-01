resource "aws_db_subnet_group" "helixemr" {
  name        = "helixemr-db-subnet-group"
  description = "Private subnet group for HelixEMR MariaDB"

  subnet_ids = [
    aws_subnet.db_private_1a.id,
    aws_subnet.db_private_1b.id
  ]

  tags = {
    Name = "helixemr-db-subnet-group"
  }
}

resource "aws_db_instance" "helixemr" {
  identifier = "helixemr-db"

  engine         = "mariadb"
  engine_version = "10.11.18"
  instance_class = "db.t4g.micro"

  allocated_storage  = 20
  storage_type       = "gp3"
  iops               = 3000
  storage_throughput = 125
  storage_encrypted  = false

  db_name  = "helixemr"
  username = "helixadmin"
  port     = 3306

  db_subnet_group_name   = aws_db_subnet_group.helixemr.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period = 1

  auto_minor_version_upgrade = true
  deletion_protection        = false

  performance_insights_enabled        = false
  iam_database_authentication_enabled = false

  skip_final_snapshot = true

  tags = {
    Name = "helixemr-db"
  }
}
