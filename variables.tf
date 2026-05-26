variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

#AWS
variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_count" {
  default = 10
}

variable "instance_type" {
  default = "t3.micro"
}

# variable "key_name" {
#   default = "ec2-key"
# }