module "amplify" {
  source = "../../../modules/amplify"

  app_name     = "time-capsule"
  app_env_name = "dev"
  owner        = "tqer39"
  repository   = "time-capsule"
  prefix       = "dev"
}
