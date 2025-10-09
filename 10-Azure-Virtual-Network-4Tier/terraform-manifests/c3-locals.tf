locals {
  owner                = var.business_division
  environment          = var.environment
  resource_name_prefix = "${var.business_division}-${var.environment}"
  common-tags = {
    owners      = local.owner
    environment = local.environment
  }
}
