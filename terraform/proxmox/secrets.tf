data "onepassword_item" "proxmox_token" {
  vault = "2tksdmduwopacqk2cplqx7e75y"
  title = "Proxmox Home"
}

data "onepassword_item" "ssh_key" {
  vault = "2tksdmduwopacqk2cplqx7e75y"
  title = "PrivateSSHKey"
}

data "onepassword_item" "k3s_server_user" {
  vault = "2tksdmduwopacqk2cplqx7e75y"
  title = "Home K3s Server User"
}
locals {
  proxmox_token_id = [for field in data.onepassword_item.proxmox_token.section[0].field : field.value if field.label == "tokenId"][0]
  proxmox_token_secret = [for field in data.onepassword_item.proxmox_token.section[0].field : field.value if field.label == "TokenSecret"][0]

  ssh_public_key = data.onepassword_item.ssh_key.public_key

  k3s_server_username = data.onepassword_item.k3s_server_user.username
  k3s_server_password = data.onepassword_item.k3s_server_user.password
}