terraform {
  backend "s3" {
    bucket  = "notify.tools-terraform-state"
    key     = "cf-prometheus-monitoring/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }

  required_providers {
    pass = {
      source = "mecodia/pass"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "4.6.0"
    }

    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = ">= 0.12.6"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "cloudfoundry" {
  api_url             = "https://api.cloud.service.gov.uk"
  sso_passcode        = var.cloudfoundry_sso_passcode
  skip_ssl_validation = false
  app_logs_max        = 30
  store_tokens_path   = "./config.json"
}
