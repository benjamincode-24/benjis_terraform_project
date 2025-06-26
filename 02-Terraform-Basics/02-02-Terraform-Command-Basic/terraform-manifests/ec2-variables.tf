variable "ec2_key_name" { 
  description = "The name of the EC2 Key Pair"
  type        = string
}

variable "ec2_user_data" {
  description = "User data script for EC2"
  type        = string
  default     = ""
}