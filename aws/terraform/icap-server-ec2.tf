resource "aws_instance" "icap-server" {
  ami           = var.icap-server-ami-id
  instance_type = var.icap-server-instance-type

  security_groups = [aws_security_group.icap-server.name]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.icap-server-root-disk-size
    delete_on_termination = true
  }

  key_name = var.icap-server-ssh-key-name

  tags = {
    Name      = "ICAP-Server-from-AMI-via-github-actions"
    Terraform = "True"
    Owner     = "SergiyGorodntchiyUpwork"
    Team      = "K8"
    Scope     = "Test AMI deployment from Github actions"
    Delete    = "No"
  }

}
