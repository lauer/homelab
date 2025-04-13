terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
    onepassword = {
      source = "1Password/onepassword"
      version = "2.1.2"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.0.12:8006/api2/json"  
  pm_api_token_id = local.proxmox_token_id
  pm_api_token_secret = local.proxmox_token_secret
  pm_tls_insecure = true
  pm_debug = true
}

provider "onepassword" {
  account               = "my.1password.com"
  op_cli_path           = "op"
}
