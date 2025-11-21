variable "project_name" {
  type        = string
  description = "Nome base do projeto"
  default     = "techfusion"
}

variable "aws_region" {
  type        = string
  description = "Região da AWS"
  default     = "us-east-1"
}

# Credenciais Azure (via Service Principal)
variable "azure_subscription_id" {
  type        = string
  description = "ID da subscription do Azure"
  sensitive   = true
}

variable "azure_tenant_id" {
  type        = string
  description = "ID do tenant (diretório) do Azure AD"
  sensitive   = true
}

variable "azure_client_id" {
  type        = string
  description = "Client ID (Application ID) do Service Principal"
  sensitive   = true
}

variable "azure_client_secret" {
  type        = string
  description = "Client Secret do Service Principal"
  sensitive   = true
}

# ===== AWS auth =====
variable "aws_access_key_id" {
  type      = string
  sensitive = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}
