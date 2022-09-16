variable "REGION" {
  description = "AWS Region"
  type = string
}

variable "vpc_id" {
  description = "Virtual Private Cloud id"
  type = string
}

variable "ingress_ports" {
    description = "ingress ports to open in security group"
    type = list(number)
}

variable "my_global_ip" {
    description = "Global IP Address using in runtime"
    type = string
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