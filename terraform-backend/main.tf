provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket-${var.git_user}-${var.git_repo}"
    acl    = "private"
    versioning { enabled = true }
}

# Define the DynamoDB table to maintain the Terraform state lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name          = "terraform-state-lock-table-${var.git_user}-${var.git_repo}"
  billing_mode  = "PAY_PER_REQUEST"
  read_capacity = 20 # 25 is Max for Free tier
  write_capacity = 20 # 25 is Max for Free tier
  hash_key      = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled = true
  }
}
