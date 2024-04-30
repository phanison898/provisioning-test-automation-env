output "instance_public_ip" {
  description = "Get public ip's of available ec2-instances"
  value       = [aws_instance.selenium_hub.public_ip]
}