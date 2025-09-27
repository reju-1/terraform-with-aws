terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

# Globally configure your providers
provider "aws" {
  # Example: region = "us-east-1"
}

provider "random" {
  # No configuration needed in most cases
}

provider "local" {
  # No configuration needed in most cases
}
