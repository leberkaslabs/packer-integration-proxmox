packer {
  required_plugins {
    ansible = {
        version = "v1.1.4"
        source = "github.com/hashicorp/ansible"
    }
    proxmox = {
      version = "v1.2.3"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}
