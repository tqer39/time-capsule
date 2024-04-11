locals {
  aws_account_id = "107662415716"
  aws_env_name   = "dev"
  organization   = "tqer39"
  platform       = "aws"
  prefix         = "tc"
  owner          = "tqer39"
  region = {
    apne1 = "ap-northeast-1"
  }
  repository = "time-capsule"
}

locals {
  common_tags = {
    "${local.prefix}:environment" = local.aws_env_name
    "${local.prefix}:iac"         = "terraform"
    "${local.prefix}:owner"       = "${local.owner}+${local.platform}-${local.aws_env_name}@gmail.com"
    "${local.prefix}:product"     = "time-capsule"
    "${local.prefix}:repository"  = "${local.organization}/${local.repository}"
  }

  # tflint-ignore: terraform_unused_declarations
  tfstate_bucket_name = {
    apne1 = "terraform-tfstate-${local.owner}-${local.aws_account_id}-${local.region.apne1}"
  }
}
