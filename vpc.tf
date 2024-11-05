resource "aws_vpc" "one" {
tags = {
Name = "myvpc"
}
cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
enable_dns_hostnames = "true"
}

resource "aws_subnet" "two" {
vpc_id = aws_vpc.one.id
tags = {
Name = "mysubnet"
}
availability_zone = "ap-south-1a"
cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "three" {
tags = {
Name = "myigw"
}
vpc_id = aws_vpc.one.id
}

resource "aws_route_table" "four" {
tags = {
Name = "myroutetable"
}
vpc_id = aws_vpc.one.id
route {
gateway_id = aws_internet_gateway.three.id
cidr_block = "0.0.0.0/0"
}
}
