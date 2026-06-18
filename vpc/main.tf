resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "pub-sub" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.availability_zone1
  cidr_block              = var.pub_sub_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-sub"
  }
}
resource "aws_subnet" "pvt-sub" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.availability_zone2
  cidr_block              = var.pvt_sub_cidr
  map_public_ip_on_launch = false
  tags = {
    Name = "pvt-sub"
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.myigw.id
  }
}
resource "aws_route_table_association" "myroute-sub-association" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.myrt.id
}