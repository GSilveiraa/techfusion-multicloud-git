output "webapp_default_hostname" {
  description = "Hostname padrão (xxxxx.azurewebsites.net)"
  value       = azurerm_windows_web_app.api.default_hostname
}
