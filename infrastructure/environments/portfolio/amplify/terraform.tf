terraform {
  required_version = "1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-tfstate-tqer39-107662415716-ap-northeast-1"
    encrypt = true
    key     = "time-capsule/infrastructure/environments/portfolio/portfolio-amplify.tfstate"
    region  = "ap-northeast-1"
  }
}
