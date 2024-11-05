resource "aws_s3_bucket" "one" {
bucket = "terraformp.bucket"
}

resource "aws_s3_bucket_versioning" "one" {
bucket = aws_s3_bucket.one.id
versioning_configuration {
status = "Enabled"
}
}


#### add and store the state file in s3 bucket

terraform {
backend "s3" {
bucket = "terraformp.bucket"
key = "prasad/terraform.tf.statefile"
region = "ap-south-1"
}
}

### sysntax for creating multiple s3 buckets

resource "aws_s3_bucket" "multiple" {
count = var.abc
bucket = "my-bucket-${count.index}"
}

variable "abc" {
type = number
default =3
}


