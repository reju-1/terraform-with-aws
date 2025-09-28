# ---------------Fetch the current AWS account identity--------------------
data "aws_caller_identity" "current" {}

output "caller_info" {
  # Printing all the info of caller
  value = data.aws_caller_identity.current
}


# ---------------Fetch a specific S3 bucket by name-------------------------
data "aws_s3_bucket" "curr_bucket" {
  bucket = "tf-state-archive"
}

output "bucket_info" {
  value = data.aws_s3_bucket.curr_bucket
  # You can individually access attributes like:
  # - data.aws_s3_bucket.curr_bucket.arn
  # - data.aws_s3_bucket.curr_bucket.region
  # - data.aws_s3_bucket.curr_bucket.force_destroy
}


# -----------------------Fetch the Ubuntu AMI------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ubuntu_image" {
  # Printing the selected attributes of the Ubuntu AMI

  value = {
    id               = data.aws_ami.ubuntu.id
    architecture     = data.aws_ami.ubuntu.architecture
    deprecation_time = data.aws_ami.ubuntu.deprecation_time
  }
}
