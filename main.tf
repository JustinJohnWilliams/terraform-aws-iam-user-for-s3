terraform {
  required_version = ">= 1.2.9"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_iam_user" "this" {
  name          = var.user_name
  path          = var.path
  force_destroy = var.force_destroy
}

data "aws_iam_policy_document" "s3_read_only_bucket" {
  statement {
    sid = "ListBucket"
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}"
    ]
  }

  statement {
    sid = "ReadObjects"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

resource "aws_iam_user_policy" "this" {
  name   = "${var.user_name}-s3-readonly-${var.bucket_name}"
  user   = aws_iam_user.this.name
  policy = data.aws_iam_policy_document.s3_read_only_bucket.json
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}
