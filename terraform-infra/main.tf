# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# Define security group for Jenkins instance
resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Security group for Jenkins instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingres_22_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Provision EC2 instance for Jenkins
resource "aws_instance" "jenkins_instance" {
  ami             = var.ubuntu_ami
  instance_type   = var.ec2_instance_type
  user_data       = file("init-script.sh")
  key_name        = var.ssh_key
  security_groups = [aws_security_group.jenkins-sg.name]

  tags = {
    Name = "jenkins"
  }
}