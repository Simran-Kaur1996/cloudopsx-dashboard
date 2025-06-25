# 🌩️ CloudOpsX – Intelligent Inventory Monitoring Dashboard

**CloudOpsX** is a fully cloud-native inventory analytics platform that enables businesses to **track inventory, visualize stock trends, monitor suppliers, and receive proactive alerts**—all through a beautiful and interactive dashboard.

Built with the power of **AWS, React, Kubernetes, Terraform, and full CI/CD automation**, this project showcases advanced cloud engineering and DevOps principles in action.

> 🎯 Real-time data • Serverless APIs • Scalable Infrastructure • CI/CD Automation • Modern UI

---

## 🧠 Key Features

| 🔍 Feature              | 💬 Description                                                                 |
|------------------------|-------------------------------------------------------------------------------|
| 📊 **Dynamic Charts**   | 5+ real-time charts: Bar (category), Pie (stock), Donut (supplier), Scatter (price vs qty), Line (trend) |
| 🔔 **Smart Alerts**     | Auto-detect low inventory and trigger alert banners or messages               |
| ☁️ **Cloud-Native**     | Built on AWS Lambda, API Gateway, DynamoDB, EKS, S3 with Terraform            |
| ⚙️ **DevOps Automation**| Jenkins CI builds → Docker image pushed to ECR → Argo CD auto-deploys to EKS |
| 🎨 **Professional UI**  | Clean React UI using Chart.js + Tailwind CSS with dark mode support           |
| 🔐 **Security Focused** | IAM best practices, `.env.example`, and secrets managed securely              |

---

## 🖼️ Live Demo (Optional)

> 🔗 Coming Soon — Deployed on EKS via Argo CD, fronted by an AWS Load Balancer

---

## 🧱 Architecture Diagram

```mermaid
graph TD
  React[React Frontend]
  API[API Gateway]
  Lambda[AWS Lambda Functions]
  DB[DynamoDB]
  CI[Jenkins CI/CD]
  ECR[ECR - Docker Image Repo]
  Argo[Argo CD]
  EKS[EKS Cluster]

  React -->|Fetch Data| API --> Lambda --> DB
  CI -->|Build Docker| ECR --> Argo
  Argo -->|Sync + Deploy| EKS --> React

