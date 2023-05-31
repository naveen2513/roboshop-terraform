locals {
  name = var.env !="" ? "{var.component.name}-${var.env}" : var.components_name
}