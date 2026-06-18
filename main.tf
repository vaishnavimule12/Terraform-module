module "myvpc"{
    source = "vpc"
    region = var.region
    vpc_cidr = var.vpc_cidr
    pub_sub_cidr = var.pub_sub_cidr
    pvt_sub_cidr = var.pvt_sub_cidr
    availability_zone1 = var.availability_zone1
    availability_zone2 = var.availability_zone2
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = var.vpc_security_group_ids
    route_cidr = var.route_cidr
}
module "myinstance"{
    source = "instance"
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    aws_security_group = module.myvpc.vpc_security_group_id
    tag_name = var.tag_name
}