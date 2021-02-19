terraform {
  required_version = ">=0.14.7"
  backend "s3" {
    bucket = "glasswall-github-actions-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    #    dynamodb_table = "terraform"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }
}

# We will use this simple module to bootstrap S3 bucket for keeping TF state, and
# DynamoDB to provide state locks
module "prepare-s3-backend" {
  source               = "./modules/prepare-s3-backend"
  s3_bucket_name       = "glasswall-github-actions-terraform-tfstate"
  dynamo_db_table_name = "terraform"
}
