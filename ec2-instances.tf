resource "aws_instance" "selenium_hub" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.docker_sg.name]

  tags = {
    Name = "selenium_hub"
  }

  provisioner "file" {
    content     = file("docker-compose.yml")
    destination = "docker-compose.yml"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo yum install -y git",
      "sudo systemctl start docker",
      "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo docker-compose up -d --scale chrome=1 --scale firefox=1 --scale edge=1"
    ]
  }

  connection {
      type        = "ssh"
      user        = "ec2-user" 
      private_key = file("${var.private_key_location}")
      host        = self.public_ip
      timeout     = "10m"
    }
}

resource "null_resource" "local" {
  depends_on = [aws_instance.selenium_hub]

  provisioner "local-exec" {
    # if local machine is Linux
    # command = "rm -f text.txt && echo ${aws_instance.selenium_hub.public_ip} > ip.txt"

    # if local machine is Windows
    command = "del /q /f ip.txt && echo ${aws_instance.selenium_hub.public_ip} > ip.txt"
  }
}
