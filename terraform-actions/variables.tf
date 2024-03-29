variable "aws_region" {
  type      = string
  sensitive = true
}

variable "aws_account_id" {
  type      = string
  sensitive = true
}

variable "git_user" {
  description = "GitHub user name"
  type        = string
  sensitive   = true
}

variable "git_repo" {
  description = "GitHub repository name"
  type        = string
  sensitive   = true
}

variable "git_branch" {
  description = "Git branch name"
  type        = string
  default     = "develop"
}

variable "githa_assume_role" {
  description = "GitHub Actions assume role name"
  type        = string
  sensitive   = true
}