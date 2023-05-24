resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.image_id
  instance_type          = var.instant_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.components_name
  }
}
resource "null_resource" "provisinor" {
  depends_on = [aws_instance.instance,aws_route53_record.records]

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
      "rm -rf roboshop-scripting",
      "git clone http://github.com/naveen2513/roboshop-scripting",
      "cd roboshop-scripting",
      " sudo bash ${var.components_name}.sh ${lookup(var.password}"
    ]
  }

}



resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z09466133SH7C438NSMD2"
  name    = "${var.components_name}.naveendevops2.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}