resource "aws_s3_bucket" "test" {
  bucket = "one-buggy-boi"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  logging {
    target_bucket = "one-loggy-boi"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "test" {
  bucket                  = aws_s3_bucket.test.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"
}
