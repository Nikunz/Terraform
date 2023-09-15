variable "elasticapp" {
  default = "myapplication"
}
variable "beanstalkappenv" {
  default = "myenvironment"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v3.3.14 running Python 3.8"
}
variable "tier" {
  default = "WebServer"
}
 
variable "vpc_id" {
    default = "vpc-007cf62dc349b3e83"
}
variable "public_subnets" {
    default = ["subnet-010b59c552310d5a0", "subnet-0d0a900706d01b0c4"]
}
