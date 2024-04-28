# Configure the AWS Provider
provider "aws" {
  region                    = "eu-west-2"
  profile                   = "kenken"
}

# Create a VPC
module "vpc" {
  source                    = "../modules/vpc"
  region                    = var.region
  project_name              = var.project_name
  vpc_cidr                  = var.vpc_cidr
  public_subnet_az1_cidr    = var.public_subnet_az1_cidr
  
}