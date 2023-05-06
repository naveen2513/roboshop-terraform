data "aws_ami" "centos" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.centos.image_id
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "frontend.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}




  resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "frontend" {
  value = aws_instance.frontend.private_ip
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "mongodb.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}
resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "mongodb"
  }
}
output "monogodb" {
  value = aws_instance.mongodb.private_ip
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "cataologue"
  }
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "catalogue.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "user.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "cart"
  }
}

  resource "aws_route53_record" "cart" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "cart.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.cart.private_ip]
  }

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "shipping"
  }
}

  resource "aws_route53_record" "shipping" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "shipping.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.shipping.private_ip]
  }
resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "rabbitmq"
  }
}

  resource "aws_route53_record" "rabbitmq" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "rabbitmq.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.rabbitmq.private_ip]
  }
resource "aws_instance" "sql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "sql"
  }
}

  resource "aws_route53_record" "sql" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "sql.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.sql.private_ip]
  }
resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "payment"
  }
}

  resource "aws_route53_record" "payment" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "payment.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.payment.private_ip]
  }

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "redis"
  }
}
  resource "aws_route53_record" "redis" {
    zone_id = "Z09466133SH7C438NSMD2"
    name    = "redis.naveendevops2.online"
    type    = "A"
    ttl     = 30
    records = [aws_instance.redis.private_ip]
  }