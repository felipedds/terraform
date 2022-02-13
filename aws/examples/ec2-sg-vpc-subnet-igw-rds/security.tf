# Create Security Group SSH
resource "aws_security_group" "allow_ssh" {
    name = "iti_allow_ssh"
    description = "Allow SSH"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
    }
}

# Create Security Group Outbound
resource "aws_security_group" "allow_outbound" {
    vpc_id = aws_vpc.main.id
    name = "iti_allow_outbound"
    description = "Allow Outbound"

    ingress {
        description = "Outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Create Security Group Postgres
resource "aws_security_group" "database" {
    vpc_id = aws_vpc.main.id
    name = "iti_databse"
    description = "Allow Postgres"

    ingress {
        description = "Postgres"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        self        = true
    }
}