#Variables file

variable "ami_id" {
  type    = string
  default = "ami-0f844a9675b22ea32"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id_1" {
  description = "subnet ID in your VPC"
  default     = "subnet-010b59c552310d5a0"
}

variable "subnet_id_2" {
  description = "subnet ID in your VPC"
  default     = "subnet-0d0a900706d01b0c4"
}
