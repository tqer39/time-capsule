provider "aws" {
  region = local.region.apne1
  default_tags {
    tags = merge(local.common_tags, {
      "${local.prefix}:source_path" = "./infrastructure/environments/${local.aws_env_name}/amplify"
    })
  }
}
