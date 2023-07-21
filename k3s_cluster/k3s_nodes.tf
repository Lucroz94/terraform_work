resource "proxmox_vm_qemu" "node" {

  # VM General Settings
  name        = "k3s-node-0${count.index + 1}"
  desc        = "Worker Nodes for K3S Cluster"
  target_node = "YOUR_PROXMOX_NODE"
  count       = 1 # number of VM deployed
  vmid        = "12${count.index + 1}"
  clone       = "YOUR_VM_TEMPLATE"
  onboot      = true
  oncreate    = true
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 4096
  bootdisk    = "scsi0"
  scsihw      = "virtio-scsi-single"
  # VM Network Settings

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }
  #VM Disk Settings

  disk {
    slot            = 0
    size            = "20G"
    type            = "scsi"
    storage         = "YOUR_POOL"
    iothread        = 1
    ssd             = 1
  }

  disk {
    slot            = 1
    size            = "50G"
    type            = "scsi"
    storage         = "YOUR_POOL"
    iothread        = 1
    ssd             = 1
  }

  # (Optional) IP Address and Gateway
  ipconfig0 = "ip=your.ip.adress.range${count.index + 1}/24,gw=your.ip.adress.gateway"

  ## SSHKEY

  sshkeys = var.sshkeys
}