output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.clc_vpc.id
}

output "igw_id" {
  description = "ID do Internet Gateway"
  value       = aws_internet_gateway.gw_clc_vpc.id
}

output "public_rt_id" {
  description = "ID da route table publica (compartilhada entre 1a e 1c)"
  value       = aws_route_table.public_rt.id
}

## ---------- Zona us-east-1a ---------- ##

output "public_subnet_1a_id" {
  description = "ID da subnet publica 1a"
  value       = aws_subnet.public_subnet_1a.id
}

output "private_subnet_1a_id" {
  description = "ID da subnet privada 1a"
  value       = aws_subnet.private_subnet_1a.id
}

output "rt_pub_assoc_1a_id" {
  description = "ID da associacao da subnet publica 1a com a route table publica"
  value       = aws_route_table_association.rt_pub_association_subnet_1a.id
}

output "eip_nat_gw_1a_id" {
  description = "ID (allocation id) do Elastic IP do NAT Gateway 1a"
  value       = aws_eip.eip_nat_gw_1a.id
}

output "nat_gw_1a_id" {
  description = "ID do NAT Gateway 1a"
  value       = aws_nat_gateway.nat_gw_1a.id
}

output "private_rt_1a_id" {
  description = "ID da route table privada 1a"
  value       = aws_route_table.private_rt_1a.id
}

output "rt_priv_assoc_1a_id" {
  description = "ID da associacao da subnet privada 1a com a route table privada 1a"
  value       = aws_route_table_association.rt_priv_association_subnet_1a.id
}

## ---------- Zona us-east-1c ---------- ##

## Fase 1
output "public_subnet_1c_id" {
  description = "ID da subnet publica 1c"
  value       = aws_subnet.public_subnet_1c.id
}

output "private_subnet_1c_id" {
  description = "ID da subnet privada 1c"
  value       = aws_subnet.private_subnet_1c.id
}

## Fase 2
output "rt_pub_assoc_1c_id" {
  description = "ID da associacao da subnet publica 1c com a route table publica"
  value       = aws_route_table_association.rt_pub_association_subnet_1c.id
}

## Fase 3
output "eip_nat_gw_1c_id" {
  description = "ID (allocation id) do Elastic IP do NAT Gateway 1c"
  value       = aws_eip.eip_nat_gw_1c.id
}

output "nat_gw_1c_id" {
  description = "ID do NAT Gateway 1c"
  value       = aws_nat_gateway.nat_gw_1c.id
}

## Fase 4
output "private_rt_1c_id" {
  description = "ID da route table privada 1c"
  value       = aws_route_table.private_rt_1c.id
}

output "rt_priv_assoc_1c_id" {
  description = "ID da associacao da subnet privada 1c com a route table privada 1c"
  value       = aws_route_table_association.rt_priv_association_subnet_1c.id
}
