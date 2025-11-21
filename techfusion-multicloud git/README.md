# TechFusion Corp – Projeto de Infraestrutura Multicloud com Terraform (AWS + Azure)

## 1. Introdução

A TechFusion Corp. é uma empresa fictícia especializada em serviços de streaming de dados em tempo real. Devido à expansão global, a empresa precisa garantir **alta disponibilidade**, **resiliência** e **conformidade regional**. Para isso, foi adotada uma estratégia **multicloud**, utilizando **AWS** e **Microsoft Azure**.

Este projeto implementa, via **Terraform**, uma infraestrutura básica porém realista em duas nuvens públicas, e automatiza o deploy através de **Azure DevOps (CI/CD)**.

## 2. Objetivo Geral

Projetar, implementar e documentar uma infraestrutura multicloud utilizando **Terraform** como ferramenta de *Infrastructure as Code (IaC)*, integrando recursos da **AWS** e da **Azure** em um cenário corporativo.

## 3. Arquitetura Geral

### 3.1 Visão Macro

- **AWS**
  - 1 instância **EC2 t2.micro** rodando Nginx (simulando API de streaming).
  - **Security Group** liberando HTTP (porta 80).
  - **S3 Bucket** para logs/artefatos.

- **Azure**
  - **Resource Group** dedicado (`techfusion-az-rg`).
  - **App Service Plan F1 (Free)** para Windows.
  - **Windows Web App** (API de streaming na Azure).
  - **Storage Account** para logs/artefatos.

- **Integração Multicloud (conceitual)**
  - Em produção, seria utilizado um DNS global (ex.: Route 53 ou Azure DNS) com:
    - **Failover** (primário AWS, secundário Azure) ou
    - **Weighted routing** (50% AWS / 50% Azure).
  - Neste laboratório, o acesso é feito diretamente:
    - `http://<IP_AWS>` (EC2)
    - `https://<nome>.azurewebsites.net` (Web App)

### 3.2 Diagrama (texto)

```text
[Clientes] 
    |
    |--- Acesso direto AWS:  http://<IP_PUBLICO_EC2>
    |
    |--- Acesso direto Azure: https://<nome>.azurewebsites.net

AWS:
  VPC default
    └─ EC2 t2.micro + Nginx
    └─ Security Group (porta 80)
    └─ S3 Bucket (logs)

Azure:
  Resource Group
    └─ App Service Plan F1 (Free)
    └─ Windows Web App
    └─ Storage Account (logs)


#Resultados do deploy

aws_api_public_ip = "3.134.82.132"
aws_api_url = "http://3.134.82.132"
azure_api_hostname = "techfusion-az-api.azurewebsites.net"
azure_api_url = "https://techfusion-az-api.azurewebsites.net"