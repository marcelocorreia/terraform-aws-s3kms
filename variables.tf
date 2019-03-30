variable "bucket_name" {}

variable "acl" {
  default = "private"
  description = "Bucket ACL [private|public]"
}

variable "enable_versioning" {
  default = false
  description = "Enables S3 Versioning"
}

variable "tags" {
  default = {}
  type    = "map"
  description = "Bucket Tags"
}
