terraform {
  backend "s3" {
    bucket = "cloud-foundation-vini-docs-619980339371-us-east-1-an"
    key    = "terraform/terraform.tfsate"
    region = "us-east-1"
#    use_lockfile = true
#    encrypt = true
  }
}
