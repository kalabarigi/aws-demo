provider "aws" {
  region     = "us-east-1" # Change this to your desired region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "tcs-user"
  monitoring             = true
  vpc_security_group_ids = ["tcs-sg"]
  subnet_id              = "tcs-subnet"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
