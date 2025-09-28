## Day 3

**Learning Outcome**
- S3 remote backend
- Data block

### Remote Backend

Remote backends store Terraform state files in a shared location, enabling team collaboration and providing enhanced security and durability compared to local state files.

#### S3 Remote Backend

Amazon S3 is one of the most popular remote backends for Terraform state management.

**Key Benefits:**
- **Durability**: S3 provides 99.999999999% (11 9's) durability
- **Versioning**: Enable S3 versioning for state file history
- **Encryption**: Server-side encryption for sensitive data
- **Access Control**: IAM policies for fine-grained permissions

**Note:** DynamoDB state locking is still functional, **it will be deprecated soon** in favor of S3's native locking mechanisms.


---

### Data Block

Data blocks allow Terraform to fetch information from existing infrastructure or external sources without managing those resources directly.

#### Syntax and Structure

```hcl
data "provider_resource_type" "name" {
  # Query parameters
  argument = "value"
  
  # Optional filters
  filter {
    name   = "tag:Environment"
    values = ["production"]
  }
}
```

#### Key Characteristics

- Data blocks only read existing resources (like API calls for read data)
- Cannot create, modify, or destroy resources
- Refreshed during `terraform plan` and `terraform apply`
- Access attributes using `data.resource_type.name.attribute`
- Support complex queries and filtering


#### Common Use Cases

- **Fetching AMI IDs** - Get latest OS images dynamically
- **Retrieving VPC Information** - Reference existing network infrastructure
- **External Data Sources** - Execute scripts, API calls, or commands
- **Key Pairs** - Reference existing SSH key pairs
- **IAM Roles and Policies** - Get existing IAM resources


#### Best Practices

- Use specific filters to reduce query time
- Cache data sources when possible
- Avoid unnecessary data block refreshes
- Always validate data block results exist
- Implement fallback values for optional data

#### Data vs Resource Blocks

|   Aspect  |   Data Block  | Resource Block|
|-----------|---------------|---------------|
| Purpose   | Read existing | Create/manage |
| State     | Not tracked   | Fully tracked |
| Lifecycle | Refresh only  | Full CRUD     |
| Dependencies | Can depend on resources | Can depend on data |
