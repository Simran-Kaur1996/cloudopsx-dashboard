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

