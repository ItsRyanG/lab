output "vms" {
  value = {
    for k, vm in proxmox_vm_qemu.vm : k => {
      vmid        = vm.vmid
      name        = vm.name
      target_node = vm.target_node
      memory      = vm.memory
      cores       = vm.cores
    }
  }
}
