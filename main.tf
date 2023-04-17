provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "Web-Server" {
  ami           = "ami-0ad97c80f2dfe623b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Web-SG.id]
  user_data     = <<-EOF
#!/bin/bash
# use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
EOF
  tags = {
    Name = "Terraform-instance"
  }
}

resource "aws_security_group" "Web-SG" {
  name        = "Terraform SG"
  description = "Allow HTTP(S) inbound traffic"

  ingress {
    description      = "Inbound rule for HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Inbound rule for HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
    Owner = "Emmanuel Okororie"
  }
}