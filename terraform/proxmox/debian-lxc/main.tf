# https://registry.terraform.io/providers/wearespindle/proxmox/latest/docs
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
resource "proxmox_lxc" "new_ct" {
    # Clone VM Template
    target_node = var.proxmox_node
    hostname = var.proxmox_host_name
    description = "Debian 12 Bookworm (CT)"
    ostemplate = "backup:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
    password =  var.machine_password
    unprivileged = true
    vmid = var.proxmox_vmid
    onboot = true
    cores = 1
    memory = "512"
    swap = "512"
    force = true
    start = true

    features {
        nesting = true
    }

    rootfs {
        storage = "local-lvm"
        size = "8G"
    }

    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "192.168.99.${ var.proxmox_vmid }/24"
        gw = "192.168.99.1"
        firewall = false
    }
}
