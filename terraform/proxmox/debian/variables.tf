variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

variable "proxmox_node" {
    type = string
}

variable "proxmox_host_name" {
    type = string
}


variable "proxmox_vmid" {
    type = number
}

variable "machine_password" {
    type = string
    sensitive = true
}