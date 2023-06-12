module "database-servers" {
  for_each = var.database_servers

  source = "./module"
  components_name = each.value["name"]
  password = lookup(each.value, "password", "null" )
  instant_type = each.value["instant_type"]
  env = var.env
  provisioner = true
  app_type="db"

}


module "app-servers" {
  depends_on = [module.database-servers]
  for_each = var.app_servers
  source = "./module"
  components_name = each.value["name"]
  password = lookup(each.value, "password", "null" )
  instant_type = each.value["instant_type"]
  env = var.env
  provisioner = true
  app_type="app"
}