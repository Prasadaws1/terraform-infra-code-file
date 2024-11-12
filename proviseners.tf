provisiners "local-exec" {
command = "echo 'instance create with ID: ${aws_instance.one.id}' >> prasad.txt
}


resource "aws_key_pair" "mykp" {
key_name = "5newpair"
public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_instance" "one" {
ami = "id"
instance_type = "t2.micro"
tags = {
Nmae = "myinstance"
}

provisioner "remote-exec" {
connection {
type = "ssh"
user = "ec2-user"
host = self.public_ip
private_key = file("/root/.ssh/id_rsa")
}

inline = [
"echo 'hello world'",
"sudo yum install jenkins -y",
"sudo yum install git httpd -y && systemctl start httpd",
]
}
