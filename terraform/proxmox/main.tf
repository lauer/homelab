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
    sshkeys    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCei/oMzSoKcyO8IZpPbV6zI2bMjBs3iUf364Pb6gVWWnY1sA9JnpY6sGIIGNz2ci23LGBKxyXN+8xaAZen28V/7mO73NKEfwZ4o5gzj7XrgMgwCJTjvEeFuLHbo05GMFqztc+CK3fS1NVBvi8b6w4c0gz0uvCiOg+Cy4AgcMNaoY9uWr0vuenoAi9VIXEYpdeSc/cO88espx1DNBaDRQiiYlyFLDmSkSb5LLv0Ora8bd6iUUUR7UqllC/6fq37GkTdggLQB8mIKeTrjAQt9OFm3o0ezonuNa0sKVT106rNEpFKYVqJIl76q3oe8wD+x9RhFicB9a+o6cUGbUB93WU392iGUriM7b6rdEjrq2fKKvfXsYWWMjOtGc1+uTbAbLYDm1mTLUxv0d9zDIA+I+nj2Di8ExV7jUPbEZlQKbMYSLYOdrAizhXkHfpGLq6rSABjmJVzjbJNNw1Se+71rp+3xoMICvChQp6UTvyjVVcqKpWR6VjHZdQRFiJ20LXY1B7E8IsnqemBSI42QVBaIWIZzTXlzBo9cLu3gLvdeWlubfOg9L5iGUFPdXo0ViYpVJWUi7zEEHh5+c5IPPPFRb1aM7eWkrUIqoyLM/D1Fz9UQEtznXBYsPwtcVQ5bN8tcOE10xSjG0nwJBbY/I/jMhzC+WhcNysHfwHKM3B/TsLszQ== powerlauer@gmail.com"

    disks {
      scsi {
        scsi0 {
          disk {        
            storage = "local-lvm"
            size    = "16G"                    
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