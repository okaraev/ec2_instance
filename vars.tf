variable "vpc_id" {
  description = "Virtual Private Cloud id"
  type = string
}

variable "ingress_ports" {
    description = "ingress ports to open in security group"
    type = list(number)
}

variable "source_security_group_id" {
    description = "Source Security Group ID"
    type = string
}

variable "source_cidr_block" {
    description = "Source CIDR block"
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "ami_id" {
    description = "Amazon machine image id"
    type = string
}

variable "instance_type" {
    description = "Instance type"
    default = "t2.micro"
}

variable "availability_zone" {
    description = "Availability zone"
    type = string
}

variable "subnet_id" {
    description = "Instance network subnet id"
    type = string
}

variable "security_group_name" {
    description = "Security group name"
    type = string
}

variable "rsa_key_name" {
    description = "AWS KeyManagement key name"
    type = string
    default = null
}

variable "instance_profile_name" {
    description = "AWS IAM EC2 Profile name"
    type = string
    default = null
}

variable "instance_user_data" {
    description = "AWS IAM EC2 user data"
    type = string
    default = null
}

variable "ec2_lifecycle" {
    description = "EC2 lifecycle"
    type = bool    
    default = false
}

variable "ec2_tags" {
    type = map(string)
    default = null
}