terraform {
  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = "1.36.33"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

# Vault Provider Configuration
provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

# Data Source: Retrieve OTC credentials from Vault (KV v2)
data "vault_kv_secret_v2" "otc_credentials" {
  name  = "otc"    # This is the secret name under the KV engine.
  mount = "secret" # Must match the path used when enabling KV v2.
}

# OTC Provider Configuration using values from Vault
provider "opentelekomcloud" {
  user_name   = data.vault_kv_secret_v2.otc_credentials.data["user_name"]
  password    = data.vault_kv_secret_v2.otc_credentials.data["password"]
  domain_name = data.vault_kv_secret_v2.otc_credentials.data["domain_name"]
  auth_url    = data.vault_kv_secret_v2.otc_credentials.data["auth_url"]
  region      = data.vault_kv_secret_v2.otc_credentials.data["region"]

  tenant_name = data.vault_kv_secret_v2.otc_credentials.data["tenant_name"]
}



