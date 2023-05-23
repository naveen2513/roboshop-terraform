components = {
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
    password = "RoboShop@1"
  }
  shipping ={
    name = "shipping"
    instant_type = "t3.micro"
    password = "RoboShop@1"

  }
  rabbitmq ={
    name = "rabbitmq"
    instant_type = "t3.micro"
    password = "roboshop123"
  }
  payment ={
    name = "payment"
    instant_type = "t3.micro"
    password = "roboshop123"
  }

}

env = "dev"