data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
}
data "aws_security_group" "allow-all" {
  name = "allow-all"
}