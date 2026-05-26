
module "network" {
  source = "./modules/AWS/network"

  environment = var.environment
}

module "ec2" {
  source = "./modules/AWS/ec2"

  environment    = var.environment
  instance_count = var.instance_count
  instance_type  = var.instance_type

  subnet_id = module.network.public_subnet_id
  vpc_id    = module.network.vpc_id

  # key_name = aws_key_pair.generated.key_name
}