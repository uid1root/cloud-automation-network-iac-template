module "network" {
  source = "../../modules/network"

  env = var.env

  ## VPC
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  ## Nomes das subnets
  pub_1a_name  = var.pub_1a_name
  pub_1c_name  = var.pub_1c_name
  priv_1a_name = var.priv_1a_name
  priv_1c_name = var.priv_1c_name

  ## Ranges das subnets
  pub_1a_cidr  = var.pub_1a_cidr
  pub_1c_cidr  = var.pub_1c_cidr
  priv_1a_cidr = var.priv_1a_cidr
  priv_1c_cidr = var.priv_1c_cidr

  ## Internet Gateway
  igw_name = var.igw_name
}