variable vm_name {
  type        = string
}

variable vm_machine_type {
  type        = string
  default = "f1-micro"
}

variable region {
  type        = string
}

variable Os_image {
  type        = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}
variable sub_id {
  type        = string
}

variable "SA" {
    type =  string
    
    }