locals {
  name = var.env != "" ? "${var.components_name}-${var.env}" : var.components_name
  db_commands =   [
    "rm -rf roboshop-scripting",
    "git clone http://github.com/naveen2513/roboshop-scripting",
    "cd roboshop-scripting",
    "sudo bash ${var.components_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -u https://github.com/naveen2513/roboshop-ansible roboshop.yml -e env=${var.env} -e role_name=${var.components_name}"
  ]




}


