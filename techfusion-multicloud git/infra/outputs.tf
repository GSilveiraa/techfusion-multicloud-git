output "aws_api_public_ip" {
  description = "IP público da instância EC2 na AWS"
  value       = module.aws_stack.api_public_ip
}

output "aws_api_url" {
  description = "URL HTTP para acessar a API na AWS"
  value       = "http://${module.aws_stack.api_public_ip}"
}

output "azure_api_hostname" {
  description = "Hostname padrão da Web App no Azure"
  value       = module.azure_stack.webapp_default_hostname
}

output "azure_api_url" {
  description = "URL HTTPS para acessar a API na Azure"
  value       = "https://${module.azure_stack.webapp_default_hostname}"
}
