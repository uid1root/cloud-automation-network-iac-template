variable "vpc_name" {
  type = string
  default = "terraform-automation-vpc"
}

resource "aws_vpc" "clc_vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "public_subnet_1a_tf"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.clc_vpc.id
  cidr_block = "172.16.10.0/24"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "private_subnet_1a_tf"
  }
}

## Cria Internet Gateway com a referencia da vpc clc_vpc
resource "aws_internet_gateway" "gw_clc_vpc" {
  vpc_id = aws_vpc.clc_vpc.id

  tags = {
    Name = "igw_clc_vpc_tf"
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
    Name = "public_rt_tf"
  }
}

## Associa a tabela de rota publica na subnet publica 1a ##
resource "aws_route_table_association" "rt_pub_association_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
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
    Name = "nat_gw_1a_tf"
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
    Name = "private_rt_1a_tf"
  }
}

## Associa a tabela de rota privada 1a na subnet privada 1a ##
resource "aws_route_table_association" "rt_priv_association_subnet_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt_1a.id
}

################

## Cria a subnet publica da zona 1c ##
resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.clc_vpc.id
  cidr_block        = "172.16.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public_subnet_1c_tf"
  }
}

## Cria a subnet privada da zona 1c ##
resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.clc_vpc.id
  cidr_block        = "172.16.20.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_subnet_1c_tf"
  }
}

## Associa a tabela de rota publica (ja existente) na subnet publica 1c ##
resource "aws_route_table_association" "rt_pub_association_subnet_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt.id
}

## Cria um IP publico para o NAT Gateway 1c ##
resource "aws_eip" "eip_nat_gw_1c" {
  domain = "vpc"

  tags = {
    Name = "eip_nat_gw_1c_tf"
  }
}

## Cria o NAT Gateway da zona de disponibilidade 1C ##
resource "aws_nat_gateway" "nat_gw_1c" {
  allocation_id = aws_eip.eip_nat_gw_1c.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  tags = {
    Name = "nat_gw_1c_tf"
  }

  # Garante que o Internet Gateway exista antes do NAT Gateway
  depends_on = [aws_internet_gateway.gw_clc_vpc]
}

## Cria tabela de rota privada 1C com rota para o NAT Gateway da 1C ##
resource "aws_route_table" "private_rt_1c" {
  vpc_id = aws_vpc.clc_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_1c.id
  }

  tags = {
    Name = "private_rt_1c_tf"
  }
}

## Associa a tabela de rota privada 1c na subnet privada 1c ##
resource "aws_route_table_association" "rt_priv_association_subnet_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt_1c.id
}
