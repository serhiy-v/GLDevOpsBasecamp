resource "aws_instance" "grafana-server" {
  ami           = var.ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.grafana-sg.id]
  key_name = "id_rsa"
  user_data              = file("./install-script.sh")
  

  tags = {
    Name = "EC2 instance for Grafana"
  }
}

resource "aws_security_group" "grafana-sg" {
  name = "Security Group"
  description = "Security Group for Grafana"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 3000
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

    tags = {
    Name = "Security Group for Grafana"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}