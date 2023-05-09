terraform {
  backend "s3" {
    bucket = "terraform-13"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
