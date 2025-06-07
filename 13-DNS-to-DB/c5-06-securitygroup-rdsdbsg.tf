# Security Group for AWS RDS DB
 module "rdsdb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
  #version = "4.0.0" # Module v4.0.0 is not compatible with Terraform v1.6.x


  name        = "rdsdb-sg"
  description = "Access to MySQL DB for entire VPC CIDR Block"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306 # MySQL default port
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]  
  tags = local.common_tags  
}