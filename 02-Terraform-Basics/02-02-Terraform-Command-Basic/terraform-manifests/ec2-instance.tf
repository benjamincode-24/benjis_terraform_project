# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 5.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-02457590d33d576c3" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro" # Free tier eligible instance type (Highly recommended for learning purposes)
  key_name      = var.ec2_key_name # Reference to the variable defined in ec2-variables.tf  
  user_data     = var.ec2_user_data # Reference to the variable defined in ec2-variables.tf
}