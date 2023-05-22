
resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = data.aws_ami.centos.image_id
  instance_type          = each.value["instant_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }


 provisioner "remote-exec" {

  connection {
    type     = "ssh"
    user     = "centos"
    password = "RoboShop321"
    host     = self.private_ip
  }
  inline = [
    "rm -rf roboshop-scripting",
    "git clone http://github.com/naveen2513/roboshop-scripting",
    "cd roboshop-scripting",
    " sudo bash ${each.value["name"]}.sh"
  ]
}
}

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "${each.value["name"]}.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}