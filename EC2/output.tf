# output for count

#output "ec2_public_ip" {
#     # value = aws_instance.terra_ec2_instance[*].public_ip # for single output
#     value = aws_instance.terra_ec2_instance[*].public_ip
# }

# output "aws_public_dns" {
#     value = aws_instance.terra_ec2_instance[*].public_dns  
# }

# output "ec2_private_ip" {
#     value = aws_instance.terra_ec2_instance[*].private_ip
# }

# output foreach
output "ec2_public_ip" {
    value = [for key in aws_aws_instance.terra_ec2_instance : key.public_ip]
}

output "aws_public_dns" {
    value = [for key in aws_aws_instance.terra_ec2_instance : key.public_dns]
}

output "ec2_private_ip" {
    value = [for key in aws_aws_instance.terra_ec2_instance : key.private_ip]
}
