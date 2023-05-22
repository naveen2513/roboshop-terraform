data "aws_ami" "centos" {

  most_recent      = true
  owners           = ["973714476881"]
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "components" {
  default ={
    frontend ={
      name = "frontend"
      instant_type = "t3.micro"
    }
    mongodb ={
      name = "mongodb"
      instant_type = "t3.micro"
    }
    catalogue ={
      name = "catalogue"
      instant_type = "t3.micro"
    }
    redis ={
      name = "redis"
      instant_type = "t3.micro"
    }
    cart ={
      name = "cart"
      instant_type = "t3.micro"
    }
    user ={
      name = "user"
      instant_type = "t3.micro"
    }
    mysql ={
      name = "mysql"
      instant_type = "t3.micro"
    }
    shipping ={
      name = "shipping"
      instant_type = "t3.micro"
    }
    rabbitmq ={
      name = "rabbitmq"
      instant_type = "t3.micro"
    }
    frontend ={
      name = "payment"
      instant_type = "t3.micro"
    }
  }
}
resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instant_type"]
  vpc_security_group_ids =[ data.aws_security_group.allow-all.id ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "payment" {
  for_each = var.components
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "${each.value["name"]}.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}