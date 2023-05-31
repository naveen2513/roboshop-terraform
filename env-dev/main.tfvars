app_servers = {
  frontend ={
    name = "frontend"
    instant_type = "t3.micro"
  }
  catalogue ={
    name = "catalogue"
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
  shipping ={
    name = "shipping"
    instant_type = "t3.micro"
    password = "RoboShop@1"

  }
  payment ={
    name = "payment"
    instant_type = "t3.micro"
    password = "roboshop123"
  }

}



database_servers = {
  redis ={
    name = "redis"
    instant_type = "t3.micro"
  }
  rabbitmq ={
    name = "rabbitmq"
    instant_type = "t3.micro"
    password = "roboshop123"
  }
  mysql ={
    name = "mysql"
    instant_type = "t3.micro"
    password = "RoboShop@1"
  }
  mongodb ={
    name = "mongodb"
    instant_type = "t3.micro"
  }
}

env = "dev"