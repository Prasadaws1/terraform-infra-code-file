##################### this is the process o fcreating EBS volume with the   TERRAFORM CODE ####################################3

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


######################## this is efc (elastic file store) ####################

resource "aws_efs_file_system" "efs" {
  tags = {
    Name = "my-efs"
  }
}
