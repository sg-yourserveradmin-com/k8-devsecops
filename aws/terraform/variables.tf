variable "aws_region" {
  default     = "eu-west-1"
  description = "The AWS region to deploy resources"
}

variable "icap-server-ami-id" {
  default     = "ami-0716d365e0869d33d"
  description = "ICAP server AMI ID to deploy"
}

variable "icap-server-instance-type" {
  default     = "t2.large"
  description = "ICAP server instance type"
}

variable "icap-server-root-disk-size" {
  default     = 20
  description = "ICAP server root disk size"
}

variable "icap-server-ssh-key-name" {
  default     = "sergiy_gorodnychiy_upwork"
  description = "SSH key to inject into ICAP server"
}
