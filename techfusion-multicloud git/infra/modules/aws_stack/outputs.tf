output "api_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.api.public_ip
}
