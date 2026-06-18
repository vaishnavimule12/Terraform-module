module "myvpc"{
    source = "./vpc"
    region = var.region
    vpc_cidr = var.vpc_cidr
    pub_sub_cidr = var.pub_sub_cidr
    pvt_sub_cidr = var.pvt_sub_cidr
    availability_zone1 = var.availability_zone1
    availability_zone2 = var.availability_zone2
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    route_cidr = var.route_cidr
    vpc_security_group_ids = aws_security_group.my_sg
}
module "myinstance"{
    source = "./instance"
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = aws_security_group.my_sg
    tag_name = var.tag_name
}
resource "aws_security_group" "my_sg" {
  name   = "my-sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}