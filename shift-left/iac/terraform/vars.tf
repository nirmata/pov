variable "aws_region" {
    description = "AWS region where the EC2 instance will be launched"
    default     = "us-east-1"
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    default     = "t2.micro"
}
