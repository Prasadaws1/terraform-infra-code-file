provider "aws" {
region = "ap-south-1"
}

resource "aws_instance" "flm" {
tags = {
Name = "${terraform.workspace}-server"
}
ami = "ami-04a37924ffe27da53"
instance_type = "t2.micro"
count = 0
key_name = "5newpair"
vpc_security_group_ids = [aws_security_group.mysg.id]   --> #security group
}
