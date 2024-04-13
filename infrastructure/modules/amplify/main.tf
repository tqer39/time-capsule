locals {
  branch_name = {
    dev = "main"
  }[var.app_env_name]
}

resource "aws_amplify_app" "this" {
  name       = "${var.app_name}-${var.app_env_name}"
  repository = "https://github.com/${var.owner}/${var.repository}"
}

resource "aws_amplify_branch" "this" {
  app_id      = aws_amplify_app.this.id
  branch_name = local.branch_name
}

resource "aws_amplify_domain_association" "this" {
  app_id      = aws_amplify_app.this.id
  domain_name = "${var.app_name}.${var.owner}.com"

  sub_domain {
    branch_name = aws_amplify_branch.this.branch_name
    prefix      = var.prefix
  }
}
