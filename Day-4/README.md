# Day 4: Operators, DataTypes, DataStructures, Loops & Conditionals


## All Operators in Terraform

**Arithmetic:** +, -, *, /, %  
**Logical:**  &&, ||, !
**Comparison:** ==, !=, >, <, >=, <=  

**Special / Terraform-specific:**  
- `in` → membership check (e.g., `"alice" in var.users`)  
- `*` → splat operator for resource attributes (e.g., `aws_instance.web[*].id`)  
- `...` → flatten lists or nested collections (used in for-expressions)  
- `? :` → conditional / ternary operator (e.g., `var.env == "prod" ? "large" : "small"`)


## Data Types
- **Primitive**: string, number, bool
- **Collections**: list, set, map, object, tuple
- **Special**: any, null


## Data Structures
- **list** → ordered collection
- **set** → unordered unique values
- **map** → key-value pairs
- **object** → structured data with named attributes
- **tuple** → ordered, mixed-type collection


## Conditionals

Note: Conditional expressions in Terraform are usually **single-line**.

```hcl
# Example variable
variable "env" {
  default = "dev"
}

# Basic conditional
output "instance_type" {
  value = var.env == "prod" ? "t3.large" : "t3.micro"
}

# Nested conditional
output "size" {
  value = var.env == "prod" ? "large" : (var.env == "staging" ? "medium" : "small")
}
```


## Loops in Terraform

Terraform doesn’t have a traditional `for` or `while` loop like programming languages. Instead, loops are implemented using **expressions**, **meta-arguments**, and **dynamic blocks**. those are three main ways to loop.

1. **For Expressions** → used to create or transform collections (lists or maps).  
2. **Resource Loops (Meta-Arguments)** → `count` and `for_each` are used for repeating resources.  
3. **Dynamic Blocks** → used to dynamically generate nested blocks in resources (covered later).

In this section, we will cover **for expressions**. **Resource loops** (`count`, `for_each`) and **dynamic blocks** will be covered in the Day-7 section.

```hcl
locals {
  numbers     = [1, 2]
  letters     = ["a", "b"]
  names       = ["alice", "bob", "carol"]

  # Transform collection: convert names to uppercase
  upper_names = [for name in local.names : upper(name)]

  # Filtering: only include names with length > 3
  filtered    = [for name in local.names : name if length(name) > 3]

  # Nested loops: combine numbers and letters
  combos      = [for n in local.numbers : [for l in local.letters : "${n}${l}"]]
}
```
