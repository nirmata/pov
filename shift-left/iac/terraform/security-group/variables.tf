variable "name" {
    description = "Name of the security group"
    type        = string
    default     = "terraform-instance-sg"
}

variable "description" {
    description = "Description of the security group"
    type        = string
    default     = "Allow SSH and HTTP access"
}
