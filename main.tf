provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${var.project_name}-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  enable_nat_gateway = true
}

# EC2 Instances
resource "aws_instance" "web_server" {
  count         = var.ec2_instance_count
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  subnet_id     = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  tags = {
    Name = "${var.project_name}-web-${count.index}"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "data_bucket" {
  bucket = "${var.project_name}-data-${random_id.bucket_suffix.hex}"
  acl    = "private"

  versioning {
    enabled = true
  }
}

# IAM Role
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
