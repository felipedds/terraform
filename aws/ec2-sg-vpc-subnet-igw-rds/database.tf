# Create a module of Database RDS
module "rds" {
    source      = "terraform-aws-modules/rds/aws"
    version     = "~> 3.0"    
    identifier  = "iti-rds"

    engine            = "postgres"
    engine_version    = "9.6.9"
    instance_class    = "db.t2.micro"
    allocated_storage = "20"
    storage_encrypted = false

    name     = "iti"
    username = "iti"
    password = "iti123789"
    port     = "5432"

    create_db_parameter_group = false

    major_engine_version = "9.6"
    family               = "postgres9.6"

    maintenance_window = "Mon:00:00-Mon:03:00"
    backup_window      = "03:00-06:00"

    multi_az = false

    vpc_security_group_ids = [aws_security_group.database.id]

    subnet_ids = flatten(chunklist(aws_subnet.private_subnet.*.id, 1))
}

# Exhibit the endpoint of Database
output "database_endpoit" {
    value = module.rds.db_instance_endpoint
}