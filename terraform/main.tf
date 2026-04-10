provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0f58b397bc5c1f2e8"   # Amazon Linux (may change by region)
  instance_type = "t2.micro"

  tags = {
    Name = "DevOps-Server"
  }
}