# Import the provider.
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

# Configure the libvirt provider.
provider "libvirt" {
  uri = "qemu:///system"
}

# Create a new disk for this resource.
resource "libvirt_volume" "disk_root" {
  name = "${var.dm_name}.qcow2"
  size = var.disk_root_size
}

# Create a new domain.
resource "libvirt_domain" "domain" {
  name = var.dm_name
  memory = var.dm_memory
  vcpu = var.dm_vcpu

  disk {
    volume_id = libvirt_volume.disk_root.id
  }

  disk {
    file = var.dm_disk_iso
  }

  boot_device {
    dev = [ "hd", "cdrom" ]
  }
}