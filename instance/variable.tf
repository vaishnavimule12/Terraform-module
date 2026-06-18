variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "tag_name" {}
variable "vpc_security_group_ids" {
  type = list(string)
}