provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "90c46bed2026b3a78ea868a1b48d524a03c2d7d6"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-16 18:13:30"
    git_last_modified_by = "tday93@users.noreply.github.com"
    git_modifiers        = "tday93"
    git_org              = "tday93"
    git_repo             = "terragoat"
    yor_trace            = "35370ac1-673e-4795-bac6-d6fa212b4fbb"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "90c46bed2026b3a78ea868a1b48d524a03c2d7d6"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-16 18:13:30"
    git_last_modified_by = "tday93@users.noreply.github.com"
    git_modifiers        = "tday93"
    git_org              = "tday93"
    git_repo             = "terragoat"
    yor_trace            = "04e0f556-bed0-4a83-abd3-7ba539e05280"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
