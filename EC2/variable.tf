variable "aws_ec2_instance" {
  default = "t3.micro"
  type    = string
}

variable "aws_root_default_starage_size" {
  default = 10
  type    = number

}

variable "ec2_ami_id" {
  default = "ami-01a00762f46d584a1"
  type    = string

}

variable "env" {
    default = "prd"
    type = string
  
}