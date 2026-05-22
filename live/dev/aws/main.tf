module "network" {
  source = "../../../modules/network"
  name   = "aws-dev-vpc"
  cidr   = "10.0.0.0/16"
}

resource "aws_vpc" "vpc" {
  cidr_block = module.network.cidr_block
  tags = { Name = module.network.network_name }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "dev-multi-cloud-bucket-12345"
}