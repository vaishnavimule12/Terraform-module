resource "aws_instance" "my-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = var.tag_name
    name = "my-instance"
    env  = "dev"
  }
}
