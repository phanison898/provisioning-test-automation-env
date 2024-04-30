output "instance_public_ip" {
  description = "Public IP of EC2 Instance"
  value       = [aws_instance.selenium_hub.public_ip]
}