variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"
}

variable "key_name" {
    description = "Key pair name for SSH access"
    type        = string
    default     = "my-key"
}
