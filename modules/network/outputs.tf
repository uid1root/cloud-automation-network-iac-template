############################################
# VPC
############################################
output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.clc_vpc.id
}

output "vpc_arn" {
  description = "ARN da VPC"
  value       = aws_vpc.clc_vpc.arn
}

output "vpc_cidr_block" {
  description = "Bloco CIDR da VPC"
  value       = aws_vpc.clc_vpc.cidr_block
}

output "vpc_default_security_group_id" {
  description = "ID do security group default criado com a VPC"
  value       = aws_vpc.clc_vpc.default_security_group_id
}

output "vpc_main_route_table_id" {
  description = "ID da route table principal da VPC"
  value       = aws_vpc.clc_vpc.main_route_table_id
}

############################################
# Subnets
############################################
output "public_subnet_1a_id" {
  description = "ID da subnet pública 1a"
  value       = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1c_id" {
  description = "ID da subnet pública 1c"
  value       = aws_subnet.public_subnet_1c.id
}

output "private_subnet_1a_id" {
  description = "ID da subnet privada 1a"
  value       = aws_subnet.private_subnet_1a.id
}

output "private_subnet_1c_id" {
  description = "ID da subnet privada 1c"
  value       = aws_subnet.private_subnet_1c.id
}

output "public_subnet_ids" {
  description = "Lista de IDs das subnets públicas"
  value = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1c.id,
  ]
}

output "private_subnet_ids" {
  description = "Lista de IDs das subnets privadas"
  value = [
    aws_subnet.private_subnet_1a.id,
    aws_subnet.private_subnet_1c.id,
  ]
}

output "public_subnet_cidr_blocks" {
  description = "CIDRs das subnets públicas"
  value = [
    aws_subnet.public_subnet_1a.cidr_block,
    aws_subnet.public_subnet_1c.cidr_block,
  ]
}

output "private_subnet_cidr_blocks" {
  description = "CIDRs das subnets privadas"
  value = [
    aws_subnet.private_subnet_1a.cidr_block,
    aws_subnet.private_subnet_1c.cidr_block,
  ]
}

############################################
# Internet Gateway
############################################
output "internet_gateway_id" {
  description = "ID do Internet Gateway"
  value       = aws_internet_gateway.gw_clc_vpc.id
}

output "internet_gateway_arn" {
  description = "ARN do Internet Gateway"
  value       = aws_internet_gateway.gw_clc_vpc.arn
}

############################################
# Route Tables
############################################
output "public_route_table_id" {
  description = "ID da route table pública"
  value       = aws_route_table.public_rt.id
}

output "private_route_table_1a_id" {
  description = "ID da route table privada 1a"
  value       = aws_route_table.private_rt_1a.id
}

output "private_route_table_1c_id" {
  description = "ID da route table privada 1c"
  value       = aws_route_table.private_rt_1c.id
}

output "private_route_table_ids" {
  description = "Lista de IDs das route tables privadas"
  value = [
    aws_route_table.private_rt_1a.id,
    aws_route_table.private_rt_1c.id,
  ]
}

############################################
# Route Table Associations
############################################
output "public_route_table_association_ids" {
  description = "IDs das associações da route table pública"
  value = [
    aws_route_table_association.rt_pub_association_subnet_1a.id,
    aws_route_table_association.rt_pub_association_subnet_1c.id,
  ]
}

output "private_route_table_association_ids" {
  description = "IDs das associações das route tables privadas"
  value = [
    aws_route_table_association.rt_priv_association_subnet_1a.id,
    aws_route_table_association.rt_priv_association_subnet_1c.id,
  ]
}

############################################
# Elastic IPs
############################################
output "eip_nat_gw_1a_id" {
  description = "Allocation ID do EIP do NAT Gateway 1a"
  value       = aws_eip.eip_nat_gw_1a.id
}

output "eip_nat_gw_1a_public_ip" {
  description = "IP público do NAT Gateway 1a"
  value       = aws_eip.eip_nat_gw_1a.public_ip
}

output "eip_nat_gw_1c_id" {
  description = "Allocation ID do EIP do NAT Gateway 1c"
  value       = aws_eip.eip_nat_gw_1c.id
}

output "eip_nat_gw_1c_public_ip" {
  description = "IP público do NAT Gateway 1c"
  value       = aws_eip.eip_nat_gw_1c.public_ip
}

############################################
# NAT Gateways
############################################
output "nat_gw_1a_id" {
  description = "ID do NAT Gateway 1a"
  value       = aws_nat_gateway.nat_gw_1a.id
}

output "nat_gw_1c_id" {
  description = "ID do NAT Gateway 1c"
  value       = aws_nat_gateway.nat_gw_1c.id
}

output "nat_gateway_ids" {
  description = "Lista de IDs dos NAT Gateways"
  value = [
    aws_nat_gateway.nat_gw_1a.id,
    aws_nat_gateway.nat_gw_1c.id,
  ]
}

output "nat_gateway_public_ips" {
  description = "IPs públicos dos NAT Gateways (úteis para liberar em allowlists)"
  value = [
    aws_nat_gateway.nat_gw_1a.public_ip,
    aws_nat_gateway.nat_gw_1c.public_ip,
  ]
}