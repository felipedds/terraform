// Output values

// EC2 instances
output "instance_ec2" {
  description = "EC2 instances created"
  value       = [for instance in aws_instance.ec2terraform : instance.public_dns]
}

// EC2 instance Public IP
output "instance_publicip" {
  description = "EC2 instance Public IP"
  value       = aws_instance.ec2terraform[*].public_ip
}

// EC2 instance Public DNS
output "instance_publicdns" {
  description = "EC2 instance Public DNS"
  value       = aws_instance.ec2terraform[*].public_dns
}
