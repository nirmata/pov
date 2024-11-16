module "security_group" {
    source = "./security_group"
}

module "ec2" {
    source              = "./ec2"
    ami_id              = "ami-0c02fb55956c7d316" # Replace with your AMI
    instance_type       = "t2.micro"
    key_name            = var.key_name
    security_group_id   = module.security_group.security_group_id
    tags                = { Name = "My-Terraform-Instance" }
}
