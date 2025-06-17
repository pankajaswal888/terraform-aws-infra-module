module "infra" {
  source = "../.."

  project_name        = "my-project"
  aws_region         = "us-west-2"
  ec2_instance_count = 3
}
