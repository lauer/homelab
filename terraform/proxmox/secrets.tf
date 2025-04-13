data "onepassword_item" "proxmox_token" {
  vault = "2tksdmduwopacqk2cplqx7e75y"
  title = "Proxmox Home"
}

locals {
  proxmox_token_id = [for field in data.onepassword_item.proxmox_token.section[0].field : field.value if field.label == "tokenId"][0]
  proxmox_token_secret = [for field in data.onepassword_item.proxmox_token.section[0].field : field.value if field.label == "TokenSecret"][0]
}