terraform {
  required_version = ">=1.0.11"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "=2.9.11"
    }
  }
}
## documentation : https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu