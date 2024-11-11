provider "aws" {
region = "ap-south-1"
}

provider "aws" {
region = "us-east-1"
alias = "usa"
}

#### resources of ap-south-1 #####

resource "aws_instance" "one" {
tags = {
Name = var.name
}
ami = var.ami
instance_type = var.instance-type
availability_zone = var.zone
key_name = var.key
root_block_device {
volume_size = var.volume
}
count = var.my-count
}

resource "aws_instance" "two" {
provider = aws.usa
tags = {
Name = var.us-name
}
ami = var.us-ami
instance_type = var.us-instance-type
availability_zone = var.us-zone
key_name = var.us-key
root_block_device {
volume_size = var.us-volume
}
count = var.us-my-count
}



######variables ####################

variable "instance-type" {
type = string
default = "t2.micro"
}

variable "zone" {
type = string
default = "ap-south1a"
}

variable "key" {
type = string
default = "5newpair"
}

variable "volume" {
type = number
default = 10
}

variable "my-count" {
type = number
default = 2
}

variable "ami" {
type = string
default = "ami-03753afda9b8ba740"
}

####us-variables##

variable "us-name" {
description = "my-newinstance"
type = string
default = "my-tg-instnace"
}

variable "us-instance-type" {
type = string
default = "t2.micro"
}

variable "us-zone" {
type = string
default = "us-east-1a"
}


variable "us-my-count" {
type = number
default = 2
}

variable "us-ami" {
type = string
default = "ami-063d43db0594b521b"
}


t

##### ap-south-1###variables

