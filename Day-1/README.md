# Terraform Day 1

On **Day 1**, we cover an overview of **Terraform blocks**, especially:
- `variable` (input variables)
- `output`
- `locals`


## Syntax
```hcl
block_type "block_name" "identifier" {
  # Arguments (key-value pairs)
  # Meta Arguments (if any)
  key = "value"
}
```


## Terraform Blocks
Terraform has several block types. The most commonly used are:

| Block | Description |
|-------|-------------|
| `terraform`| Configure Terraform itself (required providers, backend, CLI settings) |
| `provider` | Configure a specific provider (AWS, Azure, GCP, etc.) |
| `resource` | Define infrastructure resources to be created/managed |
| `data`     | Read existing data from resources or external sources |
| `variable` | Input variables for parameterizing configurations |
| `locals` | Local values (similar to constants in other languages like C/C++, Java) |
| `output` | Output values from your Terraform configuration |
| `module` | Call reusable modules |

### Block Usage Summary
- **Always used**: `terraform`, `provider`, `resource`, `variable`, `output`
- **Commonly used**: `data`, `locals`, `module`
- **Special cases**: `dynamic`, `provisioner`, `lifecycle`, `backend`


## Terraform Files Overview
When working with Terraform, these are the file formats we commonly encounter:

### File Extensions

|  Extension |  Description |
|------------|--------------|
| `.tf`      | Main Terraform configuration files using HCL syntax |
| `.tf.json` | Terraform configuration files using JSON syntax (alternative to `.tf`) |
| `.tfvars`  | Files that assign values to variables defined in `.tf` files |
| `.tfvars.json`   | Variable value files using JSON syntax (alternative to `.tfvars`) |
| `.tpl` / `.tftpl`| Template files used with Terraform's `templatefile()` function for dynamic content |
| `.tfstate` | Terraform's state file that tracks the current state of your infrastructure |


### File Naming Conventions
You can name your `.tf` files anything you want, but following conventions makes your code more organized and readable:
**Common naming patterns:**
- `main.tf` - Primary resource definitions
- `variables.tf` - Input variable declarations
- `outputs.tf` - Output value definitions
- `providers.tf` - Provider configurations
- `versions.tf` - Terraform and provider version constraints
- `locals.tf` - Local value definitions
- `data.tf` - Data source definitions


### Variable Files (.tfvars)
**Auto-loaded variable files:**
Terraform automatically loads these files without needing the `-var-file` flag:
- `terraform.tfvars`
- `terraform.tfvars.json`
- `*.auto.tfvars`
- `*.auto.tfvars.json`

```bash
terraform apply -var-file="dev.tfvars"
terraform apply  # Automatically loads `terraform.tfvars`
```

```bash
# Automatic loading: Terraform finds and loads `terraform.tfvars`
terraform apply

# Manual loading: Use the -var-file flag for environment-specific files (like `dev.tfvars` `prod.tfvars`)
terraform apply -var-file="dev.tfvars"
```


## Others

- **Argument**: Key-value pair inside a block that configures its behavior.  
- **Attribute**: Exposed information of a resource that can be referenced (e.g., `aws_instance.example.id`).  
- **Meta-Arguments**: Special arguments (e.g., `count`, `for_each`, `depends_on`, `provider`) that modify how resources are managed.  
- **Provisioner**: Runs scripts or commands on a resource after creation or destruction (not recommended for general configuration management).  
