provider "aws" {
  region = "ap-south-1"
}

# 🔐 Security Group
resource "aws_security_group" "devops_sg" {
  name = "devops-sg"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🖥️ EC2 Instance
resource "aws_instance" "devops_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your-keypair-name"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo systemctl enable docker

              # Pull Docker image
              sudo docker pull nishajain0708/devops-html-app

              # Run container
              sudo docker run -d -p 80:80 nishajain0708/devops-html-app
              EOF

  tags = {
    Name = "DevOps-Server"
  }
}

# 🌐 Output Public IP
output "public_ip" {
  value = aws_instance.devops_server.public_ip
}