output "instance_dns_name" {
    value = "%{if var.ec2_lifecycle}${aws_instance.instance_with_lifecycle[0].public_dns}%{ else }${aws_instance.instance_without_lifecycle[0].public_dns}%{endif}"
}

output "instance_id" {
    value = "%{if var.ec2_lifecycle}${aws_instance.instance_with_lifecycle[0].id}%{ else }${aws_instance.instance_without_lifecycle[0].id}%{endif}"
}

output "security_group_id" {
    value = aws_security_group.sg.id
}