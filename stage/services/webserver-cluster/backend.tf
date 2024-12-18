# Creation of the backend to store state 

terraform {
  backend "s3" {
    bucket = "gmai360labs-terraform-state"
    key = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "gmai360labs_terraform_locks"
    encrypt = true
  }
}