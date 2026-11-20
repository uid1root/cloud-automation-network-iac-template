terraform {
  backend "s3" {
    bucket = "clc17-meu-bucket-715574343172-us-east-1-an"
    key    = "terraform/terraform.tfsate"
    region = "us-east-1"
#    use_lockfile = true
#    encrypt = true
  }
}
