# Create a vpc
resource "aws_vpc" "vpc" {
  cidr_block            = var.vpc_cidr
  instance_tenancy      = "default"
  enable_dns_hostnames  = true

  tags                  = {
    Name                = "${var.project_name}-vpc"
  }
}

# Create an internet gateway and attach it to the vpc
resource "aws_internet_gateway" "igw" {
  vpc_id                = aws_vpc.vpc.id

  tags                  = {
    Name                = "${var.project_name}-igw"
  }
}

# Use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# Create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags                    = {
    Name                  = "${var.project_name}-public-subnet-az1"
  }
}

# Create a route table and a public route
resource "aws_route_table" "public_route_table" {
  vpc_id                  = aws_vpc.vpc.id

  route {
    cidr_block            = "0.0.0.0/0"
    gateway_id            = aws_internet_gateway.igw.id
  }

  tags                    = {
    Name                  = "${var.project_name}-public-route-table"
  }
}

# Associate the public subnet az1 to the public route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id               = aws_subnet.public_subnet_az1.id
  route_table_id          = aws_route_table.public_route_table.id
}

