provider "aws" {
  region = "us-east-1"
}

# 1️⃣ Generate SSH Key Pair
resource "tls_private_key" "jenkins_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "jenkins_key" {
  key_name   = "jenkins-key"
  public_key = tls_private_key.jenkins_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.jenkins_key.private_key_pem
  filename = "./jenkins-key.pem"
  file_permission = "0600"
}

# 2️⃣ Security Group
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Docker ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3️⃣ EC2 Instance
resource "aws_instance" "jenkins_ec2" {
  ami           = "ami-08982f1c5bf93d976" # Amazon Linux 2
  instance_type = "t2.medium"
  key_name      = aws_key_pair.jenkins_key.key_name
  security_groups = [aws_security_group.jenkins_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update system
              sudo dnf upgrade -y
              sudo dnf install git wget -y

              # Install Java 21 (Amazon Corretto)
              sudo dnf install java-21-amazon-corretto -y

              # Install Docker
              sudo dnf install docker -y
              sudo systemctl enable docker
              sudo systemctl start docker
              sudo usermod -aG docker ec2-user
              EOF

  tags = {
    Name = "JenkinsServer"
  }
}

# Outputs
output "ec2_public_ip" {
  value = aws_instance.jenkins_ec2.public_ip
}

output "private_key_file" {
  value = local_file.private_key.filename
}
