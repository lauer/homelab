# resource "proxmox_vm_qemu" "my_test" {
#   name        = "kserv-worker-${count.index + 1}"
#   target_node = "proxmox-host"
#   count       = 3

#   clone       = "ubuntu-template"
#   cores       = 2
#   memory      = 4096
#   os_type     = "cloud-init"
#   ipconfig0   = "ip=dhcp"

#   disk {
#     type    = "scsi"
#     storage = "local-lvm"
#     size    = "32G"
#   }

#   disk {
#     type    = "scsi"
#     storage = "local-lvm"
#     size    = "100G"    # Extra disk for Longhorn
#   }
# }

resource "proxmox_vm_qemu" "resource-name" {
    name = "my-test-machine"
    target_node = "pve02"
    clone = "ubuntu2204-cloud"
    
    cores = 2
    memory = 2048
}