#### this is the process o fcreating EBS volume with the   TERRAFORM CODE ##

provider "aws" {
region = "ap-south-1"
}

resource "aws_ebs_volume" "one" {
size = 10
tags = {
Name = "myebs"
}
availability_zone = "ap-south-1a"
}
