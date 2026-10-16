variable "aws_ec2_instance" {
  default = "t3.micro"
  type    = string
}

variable "aws_root_starage_size" {
  default = 15
  type    = number

}

variable "ec2_ami_id" {
  default = "ami-01a00762f46d584a1"
  type    = string

}