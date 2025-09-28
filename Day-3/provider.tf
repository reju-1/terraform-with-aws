terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }

  # Enable remote s3 backend
  backend "s3" {
    # Note: Backend config does not support input variables, locals, or expressions.
    # You must hardcode values here OR use partial configuration (pass them via CLI).
    # It is highly recommended to enable bucket versioning for safety and recovery.

    bucket = "tf-state-archive"
    region = "ap-southeast-1"
    key    = "demo_one/terraform.tfstate"
  }
}
