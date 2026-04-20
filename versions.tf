terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.41.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = "~> 1.7.0"
}
