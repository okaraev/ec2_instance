output "instance_dns_name" {
    value = "%{if var.ec2_lifecycle}${aws_instance.instance_with_lifecycle[0].public_dns}%{ else }${aws_instance.instance_without_lifecycle[0].public_dns}%{endif}"
}