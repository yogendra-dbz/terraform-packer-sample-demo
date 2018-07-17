provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}

provider "azurerm" {
  client_id="${var.client_id}"
  client_secret="${var.client_secret}"
  tenant_id="${var.tenant_id}"
  subscription_id="${var.subscription_id}"
}

provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}