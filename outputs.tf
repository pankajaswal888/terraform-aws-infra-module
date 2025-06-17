output "vpc_id" {
  value = module.vpc.vpc_id
}

output "web_server_public_ips" {
  value = aws_instance.web_server[*].public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.data_bucket.id
}
