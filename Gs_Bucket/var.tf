variable bucket_name {
  type        = string
}

variable Storage_class {
  type        = string
  default = "STANDARD"
}

variable region {
  type        = string
}

variable SA {
  type        = string
}
variable SA_ROLE {
  type        = string
  default = "roles/storage.objectViewer"
}