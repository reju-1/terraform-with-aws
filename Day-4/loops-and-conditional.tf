locals {
  users = [
    { name = "Alice", age = 25, role = "admin" },
    { name = "Bob", age = 17, role = "user" },
    { name = "Carol", age = 30, role = "user" },
    { name = "Dave", age = 20, role = "admin" },
    { name = "Eve", age = 15, role = "user" }
  ]

  numbers = [1, 2, 3, 4, 5]
}

/*
🔥 Practice Tasks (For Expressions + Conditionals)

1. Extract all user names into a list.
2. Get only the users where role == "admin".
3. Get only the users where age >= 18 (adults).
4. Create a map of { name = role } from the users.
5. For each number, return "even" or "odd".
6. Filter numbers greater than 3.   <-- (added back for completeness)
7. Group users by role (key = role, value = list of names).

👉 Use for-expressions, filtering (`if`), and conditionals (`? :`).
*/


output "extract_names" {
  description = "Extract all user names into a list."
  value       = [for u in local.users : u.name]
}

output "get_all_admins" {
  description = "Get only the users where role == admin"
  value       = [for u in local.users : u.name if lower(u.role) == "admin"]
}

output "map_name_role" {
  description = "Create a map of { name = role } from the users"
  value       = { for u in local.users : u.name => u.role }
}

output "adults" {
  description = "Get only the user names where age >= 18 (adults)"
  value       = [for u in local.users : u.name if u.age >= 18]
}

output "even_odd_number" {
  description = "Determine whether each number is even or odd"
  value       = [for n in local.numbers : n % 2 == 0 ? "even" : "odd"]

  # value     = [for n in local.numbers : (n % 2 == 0 ? "even" : "odd")]
  # value     = { for n in local.numbers : n => (n % 2 == 0 ? "even" : "odd") }
}

output "greater_than_3" {
  description = "Filter numbers greater than 3"
  value       = [for n in local.numbers : n if n > 3]
}

output "grouped_by_role" {
  description = "Group users by role"
  value       = { for u in local.users : u.role => u.name... }
}
