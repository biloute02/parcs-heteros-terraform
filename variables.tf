variable "disk_root_size" {
    description = "Size of root disk."
    type = number
}

variable "dm_name" {
    description = "Name"
    type = string
}

variable "dm_memory" {
    description = "The amount of memory."
}

variable "dm_vcpu" {
    description = "The amount of vcpu."
    type = number
}

variable "dm_disk_iso" {
    description = "Iso file path"
    type = string
}