#  Terraform AWS Infrastructure Setup

## Project Overview

This project provisions a **highly available, scalable, and secure AWS infrastructure** using **Terraform**. It follows best practices for networking, compute, database, and monitoring components typically used in production-grade environments.

---

## Architecture Components

The infrastructure includes:

### Networking

* **VPC**
* **2 Public Subnets**
* **2 Private Subnets**
* **Internet Gateway (IGW)**
* **Public Route Table**
* **Private Route Table**
* **NAT Gateway with Elastic IP**
* **Network ACL (Public Subnets)**

### Security

* **Security Groups** (for EC2, ALB, and RDS)

### Compute

* **EC2 Instance (Web Tier - Tier 1)**

### Database

* **RDS Subnet Group**
* **RDS MySQL Instance**

### Load Balancing & Scaling

* **Application Load Balancer (ALB)**
* **Target Group**
* **Launch Template**
* **Auto Scaling Group (ASG)**

### Monitoring & Messaging

* **CloudWatch Alarms (High CPU)**
* **CloudWatch Logs**
* **SNS (Notifications)**
* **SQS (Queueing Service)**

---

## 📂 Project Structure

```
terraform-aws-infra/
│── provider.tf
│── vpc.tf
│── subnets.tf
│── igw.tf
│── route_tables.tf
│── nat_gateway.tf
│── nacl.tf
│── security_groups.tf
│── ec2.tf
│── rds.tf
│── alb.tf
│── target_group.tf
│── launch_template.tf
│── asg.tf
│── cloudwatch.tf
│── sns.tf
│── sqs.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars
```

---

## Prerequisites

Make sure you have:

* Terraform installed (>= 1.x)
* AWS CLI configured (`aws configure`)
* IAM user with required permissions

---

## Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Preview Changes

```bash
terraform plan
```

### 4. Apply Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

To delete all created resources:

```bash
terraform destroy
```

---

## Security Group Note (Important)

* Allow **HTTP (80)** from Internet → ALB
* Allow **HTTP (80)** from ALB → EC2
* Allow **MySQL (3306)** from EC2 → RDS
* Restrict SSH (22) access to your IP only

---

##  Monitoring Setup

* CloudWatch alarm triggers when CPU utilization is high
* SNS sends notifications
* Logs are pushed to CloudWatch Logs

---

## Pending Tasks

* Define **NACL inbound & outbound rules**
* Fine-tune **Security Group rules**
* Add **remote backend (S3 + DynamoDB)** for state locking

---

## Best Practices Followed

* Infrastructure as Code (IaC)
* Modular structure
* High availability using multi-AZ
* Auto scaling for resilience
* Secure networking with private subnets

---

## Author

**VidhyaK (Cloud DevOps Engineer)**

---
