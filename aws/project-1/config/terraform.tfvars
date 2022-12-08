# VPC
vpc_cidr_block = "172.16.0.0/16"
vpc_tags = {
  Name = "dev_vpc"
}

# Subnet
subnet_cidr_block = "172.16.10.0/24"
subnet_tags = {
  "Name" = "dev_vpc"
}

# Security Group
security_group_tags = {
  "Name" = "allow_tls"
}

instance_config = {
  instance_1 = {
    eni_tags          = { "Name" = "dev_eni_1" }
    eni_private_ips   = ["172.16.10.100"]
    ec2_tags          = { "Name" = "dev_ec2_1" }
    ec2_ami           = "ami-01cae1550c0adea9c"
    ec2_instance_type = "t2.micro"
  }

  instance_2 = {
    eni_tags          = { "Name" = "dev_eni_2" }
    eni_private_ips   = ["172.16.10.101"]
    ec2_tags          = { "Name" = "dev_ec2_2" }
    ec2_ami           = "ami-01cae1550c0adea9c"
    ec2_instance_type = "t2.micro"
  }
}
