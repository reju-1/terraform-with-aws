#---------------Input-Variable-----------------
variable "length" {
  description = "Number of random bytes to generate for the hex suffix"
  default     = 4
  type        = number
  validation {
    condition     = var.length > 0 && var.length <= 16
    error_message = "Length must be between 1 and 16"
  }
}


#---------------Random-id-generator-----------------
resource "random_id" "suffix" {
  byte_length = var.length
}


#--------------Output/Export-Value-----------------
output "hex_string" {
  description = "Random hex string for unique suffix"
  value       = random_id.suffix.hex
}
