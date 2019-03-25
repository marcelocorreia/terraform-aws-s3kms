variable aws_region {
  type    = "string"
  default = "ap-southeast-2"
}

provider "aws" {
  region = "${var.aws_region}"
}

module "s3kms" {
  source            = "../"
  bucket_name       = "BUCKET_NAME"
  acl               = "private"
  enable_versioning = "true"

  tags = {
    "Name" = "BUCKET_NAME"
    "Hey"  = "Ho"
    "Lets" = "Go"
  }
}
