provider "aws" {
  region = local.region.apne1
  default_tags {
    tags = merge(local.common_tags, {
      "source_path" = "./infra/envs/${local.app_env_name}/base/${local.region.apne1}/cognito"
    })
  }
}
