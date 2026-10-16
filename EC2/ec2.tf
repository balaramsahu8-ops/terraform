
# Key pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("C:/BALARAM/AI/MLOPS/Teraform/EC2/ssh-key-terra.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security group
resource "aws_security_group" "my_security_group" {
  name        = "terra_security"
  description = "Allow SSH, HTTP and outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  # Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# EC2 instance
resource "aws_instance" "terra_ec2_instance" {
  # count = 2 # meta arguments 
  for_each = tomap({
    BALARAM_Terra_macro = "t3.micro"
    BALARAM_Terra_small = "t3.small"
    })
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type = each.value
  # instance_type          = var.aws_ec2_instance
  ami                    = var.ec2_ami_id

  root_block_device {
    volume_size = var.aws_root_starage_size
    volume_type = "gp3"
  }

  user_data = file("install_ngnix.sh")

  tags = {
    Name = each.key
    }
}
