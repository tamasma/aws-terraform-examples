resource "aws_s3_bucket" "s3_bucket" {
  #bucket = "my-tf-test-bucket-sam87"
  bucket = "${var.s3_bucket_prefix}-${var.environment}-${var.s3_region}"
  acl    = "private"
  tags = "${local.s3_tags}"
  region = "${var.s3_region}"
  # lifecycle {
  #   prevent_destroy = "true"
  # }

  server_side_encryption {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enable = true
  }

  lifecycle_rule {
    id = "state"
    prefix = state/
    enable = true
    }
  }
}

data "aws_iam_policy_document" "my_s3_policy" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}",
    ]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values = [
        "",
        "home/",
      ]
    }
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/home/",
      "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/home/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "my_s3_policy" {
  bucket = "${aws_s3_bucket.s3_bucket.id}"
  policy = "${data.aws_iam_policy_document.my_s3_policy.json}"
}
