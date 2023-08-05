resource "aws_security_group" "sg" {
    name = var.security_group_name
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

resource "aws_instance" "instance_with_lifecycle" {
    count = var.ec2_lifecycle ? 1 : 0
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.rsa_key_name
    iam_instance_profile = var.instance_profile_name
    user_data = var.instance_user_data
    availability_zone = var.availability_zone
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = var.subnet_id

    tags = var.ec2_tags

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_instance" "instance_without_lifecycle" {
    count = var.ec2_lifecycle ? 0 : 1
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.rsa_key_name
    iam_instance_profile = var.instance_profile_name
    user_data = var.instance_user_data
    availability_zone = var.availability_zone
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = var.subnet_id

    tags = var.ec2_tags
}