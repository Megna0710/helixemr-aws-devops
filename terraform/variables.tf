variable "aws_region" {
  description = "AWS region for the HelixEMR infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "helixemr"
}

variable "vpc_cidr" {
  description = "CIDR block for the HelixEMR VPC"
  type        = string
  default     = "10.0.0.0/16"
}
