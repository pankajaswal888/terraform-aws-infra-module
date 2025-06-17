A Terraform module to provision core AWS infrastructure including VPC, EC2 instances, S3 buckets, and IAM roles.

Features
🏗️ VPC Architecture: Public and private subnets with NAT gateway

🖥️ EC2 Instances: Configurable number of instances with security groups

📦 S3 Storage: Versioned private buckets with generated names

🔑 IAM Integration: Roles and policies for EC2 instances

📌 Tagging: Consistent naming and tagging across all resources


**Requirements**
Terraform >= 1.0

AWS Provider >= 4.0

AWS CLI configured with proper credentials
