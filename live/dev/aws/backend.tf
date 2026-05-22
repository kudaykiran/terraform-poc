terraform {
  backend "s3" {
    bucket = "tf-multicloud-state"
    key    = "dev/aws/terraform.tfstate"
    region = "ap-south-1"
  }
}