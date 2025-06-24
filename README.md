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
React (Chart.js)
↓
API Gateway → Lambda Functions → DynamoDB
↓
Terraform (IaC) + Jenkins + Docker + Amazon ECR
↓
EKS (via Helm) + Argo CD (GitOps CD)
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
## 📁 Project Structure
cloudopsx-dashboard/
├── terraform/ # Infrastructure as Code (modular Terraform)
├── frontend/ # React + Chart.js app
├── lambda/ # Serverless backend functions
├── helm/ # Helm chart for EKS deployment
├── .env.production # Environment config (excluded from Git)
├── .gitignore
└── README.md

---

## 🔐 Security Highlights

- `.env.production` stores all environment-specific values securely
- `.gitignore` excludes `.env`, `.tfvars`, `.csv`, `.terraform/`, and credentials
- AWS IAM roles follow least-privilege access design
- API Gateway URL and tokens never exposed in code

---

## 🧪 Run Locally

```bash
# 1. Clone the project
git clone https://github.com/Simran-Kaur1996/cloudopsx-dashboard.git
cd cloudopsx-dashboard

# 2. Frontend Setup
cd frontend
cp .env.production.example .env.production
npm install && npm run start

# 3. Provision AWS Infrastructure
cd terraform
terraform init
terraform apply

# 4. Dockerize Frontend and Push to ECR
docker build -t cloudopsx-frontend .
docker tag cloudopsx-frontend:latest <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/cloudopsx-frontend:latest
docker push <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/cloudopsx-frontend:latest
