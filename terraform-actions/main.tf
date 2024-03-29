provider "aws" {
  region = var.aws_region
}

resource "aws_iam_openid_connect_provider" "github_oidc_provider" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd",
    "6938fd4d98bab03faadb97b34396831e3780aea1",
  ]
}

data "aws_iam_policy_document" "ec2_management_policy_document" {
  statement {
    actions = [
      "ec2:Describe*",
      "ec2:CreateSecurityGroup",
      "ec2:DeleteSecurityGroup",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:CreateTags",
      "ec2:RunInstances",
      "ec2:TerminateInstances",
      "ec2:StopInstances",
      "ec2:StartInstances"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_management_policy" {
  name   = "GitHub_Actions_EC2_Management"
  policy = data.aws_iam_policy_document.ec2_management_policy_document.json
}

resource "aws_iam_role_policy_attachment" "ec2_management_policy_attachment" {
  role       = aws_iam_role.github_actions_ec2_role.name
  policy_arn = aws_iam_policy.ec2_management_policy.arn
}

data "aws_iam_policy_document" "github_oidc_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.git_user}/${var.git_repo}:ref:refs/heads/${var.git_branch}"]
    }
  }
}

resource "aws_iam_role" "github_actions_ec2_role" {
  name               = var.githa_assume_role
  assume_role_policy = data.aws_iam_policy_document.github_oidc_assume_role_policy_document.json
}
