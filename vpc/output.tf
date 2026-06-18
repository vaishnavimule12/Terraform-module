output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "public_subnet_id" {
  value = aws_subnet.pub-sub.id
}