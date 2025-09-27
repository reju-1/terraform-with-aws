## Random-ID
resource "random_id" "server_suffix" {
  byte_length = 4
}

output "rand_id" {
  value     = "server-${random_id.server_suffix.hex}"
  sensitive = false
}

## Random-Integer
resource "random_integer" "example" {
  min = 1000
  max = 9999

  # Optional: fixed seed makes result reproducible
  # seed = "xyz"

  # Optional: regenerates value if environment changes
  keepers = {
    environment = "dev"
  }
}

output "rand_int" {
  value = random_integer.example.result
}

## Random-String
resource "random_string" "example" {
  length  = 16
  upper   = true
  lower   = true
  special = false
}

output "rand_str" {
  value = random_string.example.result
}



/*
Most random provider resources support these common arguments:
  - keepers : A map of key–value pairs. Changing any value forces regeneration of the resource.
  - seed    : An optional string to make the random value deterministic
*/

