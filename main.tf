resource "aws_kms_key" "s3_kms_key" {
  deletion_window_in_days = 10

  tags = "${var.tags}"
}

resource "aws_kms_alias" "s3_kms_key" {
  target_key_id = "${aws_kms_key.s3_kms_key.id}"
  name          = "alias/${var.bucket_name}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "${var.acl}"

  versioning {
    enabled = "${var.enable_versioning}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.s3_kms_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = "${var.tags}"
}
