# Data sources

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Adding the remote state of the database. Idea here is to tap from the remote state of the database that has been deployed from the database code 

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "gmai360labs-terraform-state"
    key = "stage/data-store/mysql/terraform.tfstate"
    region = "us-east-2"
  }
}