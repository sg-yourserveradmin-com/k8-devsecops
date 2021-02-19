# Create an S3 bucket to store TF state
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.s3_bucket_name

  # Enable encryption at rest
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # We do not want TF to destroy this bucket
  lifecycle {
    prevent_destroy = true
  }

  # Keep versions, to provide additional state backups
  versioning {
    enabled = true
  }

  tags = {
    Terraform = "True"
    Owner     = "SergiyGorodntchiyUpwork"
    Team      = "K8"
    Scope     = "Test AMI deployment from Github actions"
    Delete    = "No"
  }
}

# Create DynamoDB table for state locking purposes
#resource "aws_dynamodb_table" "terraform_lock_state" {
#  name = var.dynamo_db_table_name

#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"
#  attribute {
#    name = "LockID"
#    type = "S"
#  }

#  tags = {
#    Name      = var.dynamo_db_table_name
#    Terraform = "True"
#    Owner     = "SergiyGorodntchiyUpwork"
#    Team      = "K8"
#    Scope     = "Test AMI deployment from Github actions"
#    Delete    = "No"
#  }
#}
