## Debian 12 Bookworm XCT on Proxmox

### Debian XLC

Create terraform.tfvars file and add your data

```conf
proxmox_api_url = "https://proxmox_url/api2/json"
proxmox_api_token_id = "root@pam!terraform"
proxmox_api_token_secret = "your_api_token_secret"
proxmox_node = "your_node"
proxmox_host_name = "your_host_name"
proxmox_vmid = 101
machine_password = "your_pass"
```

Init terraform provider

```bash
terraform init
```

Test terraform script

```bash
terraform plan
```

Apply terraform script

```bash
terraform apply
```