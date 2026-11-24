variable "env" {
  description = "Ambiente (dev, hml, prd)"
  type        = string
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

## Nomes das subnets
variable "pub_1a_name" {
  description = "Nome da subnet pública 1a"
  type        = string
}

variable "pub_1c_name" {
  description = "Nome da subnet pública 1c"
  type        = string
}

variable "priv_1a_name" {
  description = "Nome da subnet privada 1a"
  type        = string
}

variable "priv_1c_name" {
  description = "Nome da subnet privada 1c"
  type        = string
}

## Ranges
variable "pub_1a_cidr" {
  description = "CIDR da subnet pública 1a"
  type        = string
}

variable "pub_1c_cidr" {
  description = "CIDR da subnet pública 1c"
  type        = string
}

variable "priv_1a_cidr" {
  description = "CIDR da subnet privada 1a"
  type        = string
}

variable "priv_1c_cidr" {
  description = "CIDR da subnet privada 1c"
  type        = string
}

## Internet Gateway
variable "igw_name" {
  description = "Nome do Internet Gateway"
  type        = string
}