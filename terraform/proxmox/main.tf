# Proxmox Provider
terraform {
    required_version = ">= 0.13.0"
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.3"
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

# Proxmox Full-Clone from Template
resource "proxmox_vm_qemu" "k8s-ctlr" {
    # Clone VM Template
    clone = "ubuntu-server-template"
    target_node = "yoda"
    vmid = "290"

    # Summary
    desc = "Ubuntu Server 22.04.2 LTS & Kubernetes Controller"

    # VM Options
    name = "k8s-ctlr"
    onboot = true
    agent = 1
    
    # VM Hardware
    memory = 2048
    cores = 2
    sockets = 1
    cpu = "host"    
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}

resource "proxmox_vm_qemu" "k8s-node" { 
     # Clone VM Template
    clone = "ubuntu-server-template"
    target_node = "yoda"
    vmid = "291"

    # Summary
    desc = "Ubuntu Server 22.04.2 LTS & Kubernetes Node"

    # VM Options
    name = "k8s-node"
    onboot = true
    agent = 1
    
    # VM Hardware
    memory = 2048
    cores = 2
    sockets = 1
    cpu = "host"    
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
}