output "domain-name" {
  value = aws_instance.jenkins_instance.public_dns
}
