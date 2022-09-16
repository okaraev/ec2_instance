provider "aws" {
  region     = var.REGION
}

resource "aws_security_group" "sg" {
    name = "ec2_default_sg"
    vpc_id = var.vpc_id
    
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group_rule" "sg_tcp_in" {
    count = length(var.ingress_ports)
    
    protocol = "tcp"
    type = "ingress"
    from_port = var.ingress_ports[count.index]
    to_port = var.ingress_ports[count.index]
    cidr_blocks = [var.my_global_ip]
    security_group_id = aws_security_group.sg.id
}

resource "aws_instance" "instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = var.subnet_id
}