module "servers" {
  for_each = var.components

  source = "./module"
  components_name = each.value["name"]
  password = lookup(each.value, "password", "null" )
  instant_type = each.value["instant_type"]
  env = var.env
}