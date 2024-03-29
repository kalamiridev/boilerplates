# https://registry.terraform.io/providers/wearespindle/proxmox/latest/docs
terraform {
    required_version = ">= 0.13.0"
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
             version = ">=1.0.0"
        }
    }
}

# Proxmox Provider Creditials
provider "proxmox" {
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret
    
    # (Optional) Skip TLS Verification
    pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "cloud-vm" {
  count = 1
  name = "ubuntu-0${count.index + 1}"
  target_node = var.proxmox_node
  vmid = "60${count.index + 1}"
  clone = "ubuntu22.04-cloud"
  agent = 1
  os_type = "cloud-init"
  cores = 1
  sockets = 1
  cpu = "host"
  memory = 4086
  balloon = 0
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  onboot = true
  oncreate = false
  disk {
    slot = 0
    size = "64G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network
    ]
  }
  ipconfig0 = "ip=192.168.99.6${count.index + 1}/24,gw=192.168.99.1"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}