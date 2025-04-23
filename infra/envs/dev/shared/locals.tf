locals {
  aws_account_id = "072693953877"
  aws_env_name   = "portfolio"
  platform       = "aws"
  owner          = "tqer39"
  region = {
    apne1 = "ap-northeast-1"
  }
  repository = "time-capsule"
}

locals {
  common_tags = {
    "environment" = local.aws_env_name
    "iac"         = "terraform"
    "owner"       = "${local.owner}+${local.platform}-${local.aws_env_name}@gmail.com"
    "product"     = "time-capsule"
    "repository"  = "${local.owner}/${local.repository}"
  }

  # tflint-ignore: terraform_unused_declarations
  tfstate_bucket_name = {
    apne1 = "terraform-tfstate-${local.owner}-${local.aws_account_id}-${local.region.apne1}"
  }
}
