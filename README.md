# 🌩️ CloudOpsX – Intelligent Inventory Monitoring Dashboard

CloudOpsX is a full-stack, cloud-native inventory intelligence platform designed to help businesses monitor, analyze, and act on real-time stock data. Built using AWS services, React, and containerized microservices, it delivers a scalable, interactive dashboard with modern DevOps best practices.

> 🎯 Visualize stock trends • Trigger low inventory alerts • Analyze suppliers • All with real-time AWS Lambda APIs and a beautiful React UI.

---

## 🧠 Project Highlights

| Feature | Description |
|--------|-------------|
| 📊 Charts & Visuals | 5+ dynamic charts: category bar, stock pie, supplier donut, price vs quantity scatter, inventory trend line |
| 🧮 Inventory Insights | Stock status tracking with low stock alerts and real-time updates |
| ⚙️ Fully Cloud-Native | Built on AWS: Lambda, API Gateway, DynamoDB, EKS, S3 |
| 🚀 CI/CD Automation | Jenkins builds Docker → pushes to ECR → Argo CD auto-deploys to EKS |
| 🧾 Professional UI | Built with React, Chart.js, and Tailwind CSS for sleek, modern UX |

---

## 🖼️ Demo Screenshots

---

## 🧱 Architecture Diagram

```mermaid
graph TD
  React[React Frontend]
  API[API Gateway]
  Lambda[AWS Lambda Functions]
  DB[DynamoDB]
  CI[Jenkins CI/CD]
  Argo[Argo CD + EKS]

  React -->|API Request| API --> Lambda --> DB
  CI -->|Build Image| ECR --> Argo
  Argo -->|Sync Deploy| EKS --> React

##Tech Stack
Layer	Tools
Frontend	React.js, Chart.js, Tailwind CSS
Backend	AWS Lambda (Node.js), API Gateway
Database	DynamoDB
Infrastructure	Terraform, IAM, VPC, CloudWatch
CI/CD	Jenkins, Docker, ECR, GitHub, Argo CD, EKS
Auth (Optional)	AWS Cognito

🗂️ Project Structure
bash
Copy
Edit
cloudopsx-dashboard/
├── backend/               # AWS Lambda functions
├── frontend/              # React dashboard + Chart.js components
├── terraform/             # VPC, DynamoDB, API Gateway, EKS setup
├── docker/                # Dockerfile (Multi-stage React build)
├── jenkins/               # Jenkins pipeline configs
├── demo/                  # Screenshots for README
└── README.md
🚀 Setup & Deployment
🔧 Local Development (Frontend)
bash
Copy
Edit
git clone https://github.com/Simran-Kaur1996/cloudopsx-dashboard.git
cd cloudopsx-dashboard/frontend
npm install
npm start
🧠 Lambda + API Gateway
Functions located under /backend

Use AWS Console or Terraform to deploy

🛠️ Terraform Setup
bash
Copy
Edit
cd terraform
terraform init
terraform apply
Provisions: VPC, Subnets, DynamoDB, API Gateway, Lambda Roles, EKS Cluster

🐳 Docker Build
bash
Copy
Edit
cd frontend
docker build -t cloudopsx-frontend .
📦 CI/CD Pipeline (Jenkins → GitHub → Argo CD)
Jenkins builds and pushes Docker image to ECR

Updates deployment.yaml with new tag

GitHub receives commit, Argo CD detects change

Argo CD syncs latest image to EKS

✅ Features
Real-time charts with live data from DynamoDB

Low stock alerts for proactive management

Serverless API Layer with AWS Lambda

Auth-ready design (Cognito optional)

Clean UI with Tailwind and dark theme

Full CI/CD automation using Jenkins + Argo CD

🔐 Security & Best Practices
.env.example included (do not commit secrets)

Secrets managed via GitHub Actions, AWS Parameter Store

IAM roles follow least privilege principle

.gitignore updated for secure deployments

