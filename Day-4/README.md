# Day 4: Terraform Modules

This project demonstrates how Terraform modules work, including how they export and import values, module composition, and best practices for creating reusable infrastructure components.

## Module Syntax

```hcl
# Common module structure
module "<LABEL>" {
  source = "<location-of-module-sources>"
  
  # Module-specific input variables
  <variable_name> = <value>
  
  # Optional: Control resource creation
  count    = <number>              # mutually exclusive with for_each
  for_each = { <KEY> = <VALUE> }   # mutually exclusive with count
  
  # Optional: Explicit dependencies
  depends_on = [<resource.address.reference>]
}
```

**Note:** module source can be **Local paths**, **Git repositories**, **Terraform Registry**, **HTTP URLs**
[learn-more](https://developer.hashicorp.com/terraform/language/block/module)


## Standard Module Structure

```
modules/
└── module-name/
    ├── main.tf          # Primary resource definitions
    ├── variables.tf     # Input variable declarations
    ├── outputs.tf       # Output value declarations
    ├── versions.tf      # Provider version constraints
    └── README.md        # Module documentation
```

## Module Components

- **Output blocks**: Export values from modules using `output "name" { value = ... }`
- **Input variables**: Accept values into modules using `variable "name" { ... }`
- **Module chaining**: Use one module's output as another module's input (e.g., `module.my_random.hex_string`)
- **Dependencies**: Terraform automatically handles dependencies, but you can explicitly set them with `depends_on`


## Module Development Tips
- **Make it Configurable**: Use variables for customization
- **Provide Sensible Defaults**: Reduce required inputs
- **Export Useful Values**: Make outputs available for chaining
- **Document Everything**: Include clear README and comments
