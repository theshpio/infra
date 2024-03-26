variable "aws_region" {
  type      = string
  sensitive = true
}

variable "aws_account_id" {
  type      = string
  sensitive = true
}

variable "github_user" {
  description = "GitHub user name"
  type        = string
  sensitive   = true
}

variable "repo" {
  description = "GitHub repository name"
  type        = string
  sensitive   = true
}

variable "gh_branch" {
  description = "Git branch name"
  type        = string
  default     = "develop"
}
