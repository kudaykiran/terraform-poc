# output "aks_name" {
#   value = module.aks.aks_name
# }

output "ec2_public_ips" {
  value = module.ec2.public_ips
}

output "ec2_private_ips" {
  value = module.ec2.private_ips
}

output "ec2_vpc_id" {
  value = module.network.vpc_id
}

output "ec2_subnet_id" {
  value = module.network.public_subnet_id
}