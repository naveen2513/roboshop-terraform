data "aws_ami" "centos" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.centos.image_id
}

variable "instance_type" {
  default = "t3.small"
}
output "instance_type" {
  value = var.instance_type
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "components" {
  default = ["frontend","mongodb","catalogue","redis","user"]
}




resource "aws_instance" "instances" {
  count = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids =[data.aws_security_group.allow-all.id]


  tags = {
    Name = var.components[count.index]
  }
}
