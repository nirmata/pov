resource "aws_instance" "example" {
    ami           = var.ami_id
    instance_type = var.instance_type
    monitoring = true
    associate_public_ip_address = false

    tags = {
        Name = "ExampleInstance"
    }
}
