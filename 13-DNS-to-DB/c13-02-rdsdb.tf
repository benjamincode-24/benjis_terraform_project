# Create AWS RDS Database

module "rdsdb" {
 source  = "terraform-aws-modules/rds/aws"
  version = "6.12.0"  

# The RDS instance identifier must be unique within the AWS account and region.
  identifier = var.db_instance_identifier 
  
  db_name  = var.db_name # Initial name of the database to create when the DB instance is created.
  username = var.db_username # Master username for the database.
  password = var.db_password # Master password for the database.
  manage_master_user_password = false # Set to true to allow RDS to manage the master user password in Sectrets Manager.
  port     = 3306

  multi_az               = true # Multi-AZ deployments provide high availability and failover support for DB instances.
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [module.rdsdb_sg.security_group_id] # Security group for the RDS DB instance.


  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  engine_version       = "8.0"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t4g.large"

  allocated_storage     = 20 # Initial storage size in GiB for the DB instance.
  max_allocated_storage = 100 # Maximum storage size in GiB for the DB instance.

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]
  create_cloudwatch_log_group     = true

  skip_final_snapshot = true
  deletion_protection = false # Set to "true" to prevent accidental deletion of the DB instance using terraform destroy or the AWS Management Console. 

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = local.common_tags
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}