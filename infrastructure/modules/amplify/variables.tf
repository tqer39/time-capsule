variable "app_name" {
  type        = string
  description = "The environment name for the Amplify app"
}

variable "app_env_name" {
  type        = string
  description = "The environment name for the Amplify app"
}

variable "owner" {
  type        = string
  description = "The owner of the repository"
}

variable "prefix" {
  type        = string
  description = "The prefix for the resources"
  default     = ""
}
