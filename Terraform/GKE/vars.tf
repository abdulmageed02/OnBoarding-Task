variable gke_name {
  type        = string
}
variable vpc {
  type        = string
}
variable subnet {
  type        = string
}

variable region {
  type        = string
}

variable machine_type {
  type        = string
  default = "e2-standard-2"
}

variable number_of_nodes_per_zone {
  type        = number
  default = 2
}
variable disk_size_gb {
  type        = string
  default = 10
}

variable master_node_cidr {
    type        = string
    default = "192.168.1.0/28"
}
variable subnet_cidr {
  type        = string
}
variable "SA" {
    type =  string
    
    }