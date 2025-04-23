locals {
  aws_account_id = "072693953877"
  aws_env_name   = "portfolio"
  app_env_name   = "dev"
  platform       = "aws"
  owner          = "tqer39"
  region = {
    apne1 = "ap-northeast-1"
  }
  repository = "time-capsule"
}

locals {
  common_tags = {
    "environment" = local.app_env_name
    "iac"         = "terraform"
    "owner"       = "${local.owner}+${local.platform}-${local.aws_env_name}@gmail.com"
    "product"     = "time-capsule"
    "repository"  = "${local.owner}/${local.repository}"
  }
}
