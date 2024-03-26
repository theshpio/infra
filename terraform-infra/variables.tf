# Variable declaration
variable "aws_region" {
  description = "AWS region"
  type        = string
  sensitive   = true
}

variable "ec2_instance_type" {
  description = "AwS EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ubuntu_ami" {
  description = "ubuntu AMI for free tier"
  type        = string
  default     = "ami-080e1f13689e07408"
}

variable "ssh_key" {
  description = "SSH key name to access instance"
  type        = string
  sensitive   = true
}

variable "ingres_22_cidr_blocks" {
  description = "ingress port 22 public ip subnet"
  type        = list(string)
  sensitive   = true
}
