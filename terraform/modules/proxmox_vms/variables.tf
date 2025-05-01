variable "vms" {
  description = "List of complete VM configurations for k3s cluster"
  type = list(object({
    vmid              = number
    name              = string
    target_node       = string
    agent             = number
    cores             = number
    memory            = number
    boot              = string
    clone             = string
    scsihw            = string
    vm_state          = string
    automatic_reboot  = bool
    cicustom          = string
    ciupgrade         = bool
    nameserver        = string
    ipconfig0         = string
    skip_ipv6         = bool
    ciuser            = string
    sshkeys           = string
    disk_storage      = string
    disk_size         = string
    cloudinit_storage = string
    network_id        = number
    network_bridge    = string
    network_model     = string
  }))
}
