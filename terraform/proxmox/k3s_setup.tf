resource "proxmox_vm_qemu" "k3s-nodes" {
  count = 3
  name = "kserv-node-${count.index + 1}"
  vmid = "21${count.index + 1}"

  target_node = "pve0${(count.index % 3) + 1}"

  ## Clone Cloud Image
  clone = "ubuntu2404-cloud"

  # Activate QEMU agent for this VM
  agent = 1
  cores = 2
  memory = 2048

  boot        = "order=scsi0"
  scsihw      = "virtio-scsi-single"
  
  vm_state    = "running"
  automatic_reboot = true
  
  ciupgrade  = true
  nameserver = "192.168.0.1"
  ipconfig0  = "ip=192.168.0.${count.index + 84 }/24,gw=192.168.0.1,ip6=dhcp"
  skip_ipv6  = true
  ciuser     = local.k3s_server_username
  cipassword = local.k3s_server_password
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