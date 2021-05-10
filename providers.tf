provider "alicloud" {
  # Configuration options
  region = var.region
}

# assumerole到SharedServices账号
provider "alicloud" {
  alias  = "sharedservices"
  region = var.region
  assume_role {
    role_arn           = format("acs:ram::%s:role/ResourceDirectoryAccountAccessRole", alicloud_resource_manager_account.rd_account_SharedServices.id)
    session_name       = "SharedAccountLandingZoneSetup"
    session_expiration = 999
  }
}
