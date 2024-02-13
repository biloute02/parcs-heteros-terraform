# Import the provider
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

# Configure the Libvirt provider
provider "libvirt" {
  uri = "qemu:///system"
}

# Create a new domain
resource "libvirt_domain" "test1" {
  name = "test"
  vcpu = 4

  disk {
    file = "/var/lib/libvirt/images/ubuntu-22.04.3-live-server-amd64.iso"
  }
}