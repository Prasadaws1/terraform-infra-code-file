provider "aws" {
region = "ap-south-1"
}

##################security##########
resource "aws_security_group" "mysg" {
name = "${terraform.workspace}-mysg"
description = "all in one"


ingress {
from_port = 8081
to_port = 8081
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}
#####################resource#########################
resource "aws_instance" "one" {
tags = {
Name = "${terraform.workspace}-server"
}
ami = "ami-03753afda9b8ba740"
instance_type = "t2.micro"
availability_zone = "ap-south-1a"
key_name = "5newpair"
vpc_security_group_ids = [aws_security_group.mysg.id]
count = 2
root_block_device {
volume_size = 10
}
}
output "next" {
value = [aws_instance.one[0].id, aws_instance.one[0].public_ip, aws_instance.one[0].private_ip]
}

