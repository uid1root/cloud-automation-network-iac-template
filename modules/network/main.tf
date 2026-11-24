# # Correcao primeira issue
# resource "aws_flow_log" "example" {
#   log_destination      = "arn:aws:s3:::cloud-foundation-vini-docs-619980339371-us-east-1-an"
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.clc_vpc.id
# }

# # Correcao segunda issue
# resource "aws_default_security_group" "default" {
#   vpc_id = aws_vpc.clc_vpc.id
  
#   tags = {
#     Name = "my-iac-sg"
#   }
# }

resource "aws_vpc" "clc_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}-${var.env}"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "${var.pub_1a_cidr}"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "${var.pub_1a_name}-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "${var.priv_1a_cidr}"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "${var.priv_1a_name}-${var.env}"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "${var.pub_1c_cidr}"
  availability_zone = "us-east-1c" 
  tags = {
    Name = "${var.pub_1c_name}-${var.env}"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "${var.priv_1c_cidr}"
  availability_zone = "us-east-1c" 
  tags = {
    Name = "${var.priv_1c_name}-${var.env}"
  }
}

## Cria Internet Gateway com a referencia da vpc clc_vpc
resource "aws_internet_gateway" "gw_clc_vpc" {
  vpc_id = aws_vpc.clc_vpc.id

  tags = {
    Name = "${var.igw_name}-${var.env}"
  }
}

## Cria tabela de rota publica com rota para o Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_clc_vpc.id
  }

  tags = {
    Name = "public_rt_${var.vpc_name}_${var.env}"
  }
}

## Associa a tabela de rota publica na subnet publica 1a ##
resource "aws_route_table_association" "rt_pub_association_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

## Associa a tabela de rota publica na subnet publica 1c ##
resource "aws_route_table_association" "rt_pub_association_subnet_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt.id
}

## Cria um IP público para nat gateway 1a ##
resource "aws_eip" "eip_nat_gw_1a" {
  domain   = "vpc"
}

## Cria o nat gateway da zona de disponibilidade 1A ## 
resource "aws_nat_gateway" "nat_gw_1a" {
  allocation_id = aws_eip.eip_nat_gw_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = "nat_gw_1a_${var.env}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw_clc_vpc]
}

## Cria tabela de rota privada 1A com rota para o NAT Gateway da 1A
resource "aws_route_table" "private_rt_1a" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1a.id
  }

  tags = {
    Name = "private_rt_1a_${var.env}"
  }
}

## Associa a tabela de rota privada 1a na subnet privada 1a ##
resource "aws_route_table_association" "rt_priv_association_subnet_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt_1a.id
}



### ESTRUTURA 1C


## Cria um IP público para nat gateway 1c ##
resource "aws_eip" "eip_nat_gw_1c" {
  domain   = "vpc"
}

## Cria o nat gateway da zona de disponibilidade 1C ## 
resource "aws_nat_gateway" "nat_gw_1c" {
  allocation_id = aws_eip.eip_nat_gw_1c.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  tags = {
    Name = "nat_gw_1c_${var.env}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw_clc_vpc]
}

## Cria tabela de rota privada 1C com rota para o NAT Gateway da 1C
resource "aws_route_table" "private_rt_1c" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1c.id
  }

  tags = {
    Name = "private_rt_1c_${var.env}"
  }
}

## Associa a tabela de rota privada 1c na subnet privada 1c ##
resource "aws_route_table_association" "rt_priv_association_subnet_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt_1c.id
}