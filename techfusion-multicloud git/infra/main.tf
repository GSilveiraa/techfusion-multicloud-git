module "aws_stack" {
  source       = "./modules/aws_stack"
  project_name = var.project_name
  aws_region   = var.aws_region
}

module "azure_stack" {
  source       = "./modules/azure_stack"
  project_name = var.project_name
}
