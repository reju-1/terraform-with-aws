#========================= Variable block example ===========================
# https://developer.hashicorp.com/terraform/language/block/variable

# Empty variable
variable "environment" {}

# Variable with validation
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count > 0 && var.instance_count <= 10
    error_message = "Instance count must be between 1 and 10."
  }
}


#============================= Locals block ================================
# https://developer.hashicorp.com/terraform/language/block/locals 

locals {
  /*
    Locals are like constants:
    - Similar to variables but immutable
    - Evaluated once
    - Can hold expressions, maps, or computed values
  */
  project_name  = "Better-Start"
  owner         = "community-team"
  common_tags   = { Project = local.project_name, ManagedBy = "terraform" }
  instance_type = var.environment == "prod" ? "t3.large" : "t3.micro"
}


#============================= Output blocks ===============================
# https://developer.hashicorp.com/terraform/language/block/output

output "print_environment" {
  /*
    Outputs:
    - Prints value to console after `terraform apply`
    - Exports values when used as a module
  */
  description = "Shows the current environment"
  value       = "The environment is ${var.environment}"
}

output "show_locals" {
  description = "Common tags and related values"
  # Outputting multiple values as a map
  value = {
    instance_count = var.instance_count
    project_name   = local.project_name
    common_tags    = local.common_tags
  }
}
