resource "aws_instance" "this" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = var.key_name

    vpc_security_group_ids = [var.security_group_id]

    tags = var.tags
}

output "instance_public_ip" {
    description = "Public IP of the EC2 instance"
    value       = aws_instance.this.public_ip
}
