output "print_file_content" {
  /*
  Common use cases for file():
  • Reading an SSH public key
  • Loading static text files
  • Including license or config files
  • Any case where you need raw file content
  */
  value = file("data/sample-file.txt")
}


output "print_template" {
  /*
  Pass the template file path and a key-value map as arguments.

  Notes:
  - Template file can have any text extension, but `.tftpl` is recommended.
  - Common use cases:
    • Dynamic EC2 user data
    • IAM policy JSONs for cleaner code
    • Config files (nginx, apache, etc.)
    • Any file needing variables for flexibility
  */
  value = templatefile("data/template-bash.tftpl", {
    name        = "John"
    environment = "dev"
  })
}

locals {
  # Basic Values
  project_name   = "MyTerraformApp"
  instance_count = 5

  # Lists
  regions = ["us-east-1", "us-west-2", "eu-central-1"]
  ports   = [22, 80, 443]

  # Maps
  tags = {
    Owner      = "Rejo"
    Department = "Engineering"
  }

  # Nested structures
  users = [
    { name = "Alice", role = "admin" },
    { name = "Bob", role = "dev" },
    { name = "Eve", role = "devops" }
  ]
  matrix = [[1, 2], [3, 4]]
}


# ------------------------List and String Operations------------------------
output "concat_list" {
  description = "Concatenate regions and ports into a single list."
  value       = concat(local.regions, local.ports)
}

output "region_string" {
  description = "Join all regions into a single comma-separated string."
  value       = join(", ", local.regions)
}

output "first_and_last_user" {
  description = "Show the first and last user in the users list."
  value = {
    first_user = local.users[0].name
    last_user  = local.users[length(local.users) - 1].name
  }
}

output "flatten_matrix" {
  description = "Flatten a nested list (matrix) into a single list."
  value       = flatten(local.matrix)
}


# ------------------------Map Operations------------------------
output "checking_item_in_map" {
  description = "Look up 'team' in tags map; fallback to 'Not found'."
  value       = lookup(local.tags, "team", "Not found")
}

output "merge_map" {
  description = "Merge tags map with a map of usernames to their roles."
  value       = merge(local.tags, { for u in local.users : u.name => u.role })
}


# ------------------------Miscellaneous Utilities------------------------
output "try_can" {
  description = "Demonstrate try() with fallback and can() for safe evaluation."
  value = {
    "try(tonumber('abcd'))" = try(tonumber("abcd"), 0) # fallback 0 if conversion fails
    "can(tonumber('abcd'))" = can(tonumber("abcd"))    # returns false
  }
}

output "useful_utility" {
  description = "Generate a UUID and encode a simple map to JSON."
  value = {
    uuid       = uuid()
    jsonencode = jsonencode({ name = "Reju", role = "admin" })
  }
}
