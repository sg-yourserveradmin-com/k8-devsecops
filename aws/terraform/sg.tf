resource "aws_security_group" "icap-server" {
  name        = "ICAP-Server-from-AMI-via-github-actions"
  description = "Allow inbound traffic for ICAP server"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "icap"
    from_port   = 1344
    to_port     = 1344
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "icap"
    from_port   = 31829
    to_port     = 31829
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "ICAP-Server-from-AMI-via-github-actions"
    Terraform = "True"
    Owner     = "SergiyGorodntchiyUpwork"
    Team      = "K8"
    Scope     = "Test AMI deployment from Github actions"
    Delete    = "No"
  }
}
