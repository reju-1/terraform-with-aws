#---------------Input-Variable-----------------
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "The key value pair of common tags"
  type        = map(string)
  default     = {}
}


# ---------------Bucket-Creation------------------
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}


#--------------Output/Export-Value-----------------
output "bucket_name" {
  description = "The created S3 bucket name"
  value       = aws_s3_bucket.this.bucket
}

