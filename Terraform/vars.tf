variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "region" {
  type = string
}
variable "vm_name" {
  type = string
}

variable "vm_machine_type" {
  type    = string
  default = "f1-micro"
}

variable "Os_image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "bucket_name" {
  type = string
}

variable "Storage_class" {
  type    = string
  default = "STANDARD"
}
variable "gke_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-standard-2"
}
variable disk_size_gb {
  type        = string
  default = 10
}

variable "number_of_nodes_per_zone" {
  type    = number
  default = 2
}

variable "master_node_cidr" {
  type    = string
  default = "192.168.1.0/28"
}

variable "dataset_name" {
  type = string

}

variable "vm_sa" {
  type = string

}
variable "vm_sa_role" {
  type = string

}

variable "nodepool_sa" {
  type = string

}
variable "nodepool_sa_role" {
  type = string

}
