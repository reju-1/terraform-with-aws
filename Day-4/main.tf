##----------------------Local variable----------------------
locals {
  common_tags = {
    Evn     = "dev"
    Project = "dummy Project"
  }
}

## --------------------Importing-Modules----------------------
module "my_random" {
  length = 10
  source = "./modules/random"
}

module "my_bucket" {
  bucket_name = "tf-demo-${module.my_random.hex_string}"
  tags        = local.common_tags
  source      = "./modules/s3"
}


##-------------------Printing-Module-Exports----------------
output "print_module_exports" {
  value = {
    random_suffix = module.my_random.hex_string
    bucket_name   = module.my_bucket.bucket_name
  }
}

