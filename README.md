# 🌩️ CloudOpsX – Intelligent Product Inventory Dashboard
🚀 A cloud-native inventory monitoring dashboard powered by **AWS**, **Terraform**, **React**, and **Kubernetes (EKS)**.  
> Built to demonstrate real-world DevOps automation, secure infrastructure-as-code, and serverless analytics for inventory operations.
---
## 🧠 Features
- 📊 Real-time product charts using **React + Chart.js**
- 🧮 Live data from **DynamoDB** via **API Gateway + Lambda**
- 🛠️ Infrastructure provisioned using **modular Terraform**
- 🐳 Dockerized frontend deployed to **Amazon EKS** using **Helm**
- 🔁 CI/CD automation using **Jenkins + Argo CD**
- 🔐 Secure secrets management using `.env.production`, IAM, and `.gitignore`
- 🌐 Ready for **JWT-based Cognito authentication** 
---
## 🏗️ Architecture
![image](https://github.com/user-attachments/assets/f9c31186-4e0d-46f7-a701-73a8d5da7b82)

---
## 🔧 Tech Stack
| Layer        | Tools Used |
|--------------|------------|
| Frontend     | React, Chart.js, Axios, Docker |
| Backend API  | AWS Lambda, API Gateway |
| Database     | DynamoDB |
| Infrastructure | Terraform (VPC, IAM, Lambda, EKS) |
| Deployment   | Jenkins, Helm, Amazon EKS, Argo CD |
| Container Registry | Amazon ECR |
| Security     | IAM, `.env.production`, `.gitignore` |
---
## 📊 Charts Included

- Category-wise Quantity Chart (Bar)
- Stock Status Breakdown (Pie)
- Inventory Trends Over Time (Line)
- Low Stock Visual (Scatter)
- Cost vs Quantity (Mixed)
---
