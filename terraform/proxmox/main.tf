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

resource "proxmox_vm_qemu" "cloudinit-example" {
    vmid = 101
    name = "my-test-machine"
    target_node = "pve02"
    clone = "ubuntu2404-cloud"

    agent = 1
    cores = 2
    memory = 2048

    boot        = "order=scsi0"
    scsihw      = "virtio-scsi-single"
    
    ipconfig0   = "ip=dhcp"
    vm_state    = "running"
    automatic_reboot = true
    
    ciupgrade  = true
    nameserver = "192.168.0.1"
    # ipconfig0  = "ip=192.168.0.00/24,gw=192.168.0.1,ip6=dhcp"
    skip_ipv6  = true
    ciuser     = "root"
    cipassword = "CloudImage!23"
    sshkeys    = local.ssh_public_key

    disks {
      scsi {
        scsi0 {
          disk {        
            storage = "local-lvm"
            size    = "16G"                    
          }
        }
        scsi1 {
          disk {        
            storage = "local-lvm"
            size    = "50G"                    
          }
        }
      }
      ide {
        ide1 {
          cloudinit {
            storage = "local-lvm"
          }
        }
      }
    }


    network {
        id = 0
        bridge = "vmbr0"
        model = "virtio"
    }

    # Most cloud-init images require a serial device for their display
    serial {
        id = 0
    }

}