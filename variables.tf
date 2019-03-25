variable "bucket_name" {}

variable "acl" {
  default = "private"
}

variable "enable_versioning" {
  default = false
}

variable "tags" {
  default = {}
  type    = "map"
}
