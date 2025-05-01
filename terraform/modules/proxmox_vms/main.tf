terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  for_each = { for vm in var.vms : vm.name => vm }

  vmid             = each.value.vmid
  name             = each.value.name
  target_node      = each.value.target_node
  agent            = each.value.agent
  cores            = each.value.cores
  memory           = each.value.memory
  boot             = each.value.boot
  clone            = each.value.clone
  scsihw           = each.value.scsihw
  vm_state         = each.value.vm_state
  automatic_reboot = each.value.automatic_reboot

  cicustom   = each.value.cicustom
  ciupgrade  = each.value.ciupgrade
  nameserver = each.value.nameserver
  ipconfig0  = each.value.ipconfig0
  skip_ipv6  = each.value.skip_ipv6
  ciuser     = each.value.ciuser
  sshkeys    = each.value.sshkeys

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = each.value.disk_storage
          size    = each.value.disk_size
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = each.value.cloudinit_storage
        }
      }
    }
  }

  network {
    id     = each.value.network_id
    bridge = each.value.network_bridge
    model  = each.value.network_model
  }

  lifecycle {
    create_before_destroy = true
  }
}
