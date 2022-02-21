resource "aws_db_instance" "myrds" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "myrds"
  username             = "saad"
  password             = "pass123"
  parameter_group_name = "myrds.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-s3-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "mys3bucket" {
  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}