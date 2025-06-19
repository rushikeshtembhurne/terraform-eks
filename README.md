# 🚀 AWS EKS Cluster with Terraform

This project provisions a complete **Amazon EKS (Elastic Kubernetes Service)** cluster on AWS using Terraform. It includes VPC creation, subnet tagging, worker node groups, IAM roles, and security group rules required for production-ready Kubernetes setup.

---

## 📦 Features

- VPC with public and private subnets across 3 AZs
- Subnet tagging for EKS auto-discovery
- Amazon EKS control plane
- Managed Node Group configuration with auto-scaling
- IRSA (IAM Roles for Service Accounts) enabled
- Secure security group rules (ingress/egress)
- Outputs like cluster endpoint, security groups, and OIDC provider
- Highly configurable using `terraform.tfvars`

---

## 🛠️ Prerequisites

- Terraform v1.3+
- AWS CLI configured with proper IAM permissions
- Git
- kubectl (for interacting with the EKS cluster)

---

## 📁 Project Structure

```bash
terraform-eks-cluster/
├── eks-cluster.tf # EKS module definition
├── vpc.tf # VPC module definition
├── security-groups.tf # Security group + rules for EKS nodes
├── variables.tf # All input variables (shared across modules)
├── terraform.tfvars # Actual values for the variables (per environment)
├── versions.tf # Provider & Terraform version constraints
├── outputs.tf # Useful outputs (cluster_id, endpoint, etc.)
├── README.md # Project documentation
└── backend.tf (optional) # For remote state like S3 + DynamoDB
```

🧩 What It Creates
VPC with DNS and NAT Gateway

Tagged public/private subnets

EKS cluster with IRSA enabled

Managed Node Group (t3.medium by default)

Security groups for worker nodes

Outputs for kubeconfig, cluster_id, etc.

## 🚀 How to Use

### 1. Clone the repo
```bash
git clone https://github.com/rushikeshtembhurne/terraform-eks.git
cd terraform-eks
```
### 2. Initialize Terraform
```bash
terraform init
```
### 3. Plan the deployment
```bash
terraform plan
```
4. Apply the configuration
```bash
terraform apply
```
🔐 Access the EKS Cluster
Once the EKS cluster is created successfully, follow these steps to allow your IAM user or role to access the cluster using kubectl:

🔑 Step-by-step:
Go to AWS Console → EKS → Your Cluster → "Access" tab

Click on “Create Access Entry”

Under Principal ARN, select or enter the IAM Role/User ARN you want to grant access

Under Access Type, choose:

**Console and programmatic access**

Select the Kubernetes access policy:

For full access: AmazonEKSClusterAdminPolicy

For read-only: AmazonEKSViewerPolicy

Click Create access entry

Now run:
```bash
aws eks update-kubeconfig --region us-east-1 --name <generated-cluster-name>
kubectl get nodes
```
Use the cluster_id output from Terraform to plug in the cluster name.

| Name                        | Description                                     |
| --------------------------- | ----------------------------------------------- |
| `cluster_id`                | EKS cluster name/ID                             |
| `cluster_endpoint`          | API endpoint for the Kubernetes control plane   |
| `cluster_security_group_id` | Security group ID attached to the control plane |
| `region`                    | AWS region in use                               |
| `oidc_provider_arn`         | ARN of OIDC provider for IRSA                   |


📌 Note
This repo uses the following official Terraform modules:

terraform-aws-modules/eks/aws

terraform-aws-modules/vpc/aws

✅ Make sure your AWS CLI is configured and has proper IAM permissions to create EKS resources.

🙌 Author
Made with ❤️ by Rushikesh Tembhurne

📇 [LinkedIn](https://www.linkedin.com/in/rushikeshtembhurne)



