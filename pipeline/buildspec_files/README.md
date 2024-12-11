# Connect DevOps Pipeline - Buildspec Files

These buildspec files define the steps for storing Terraform's `tfstate` file in S3 buckets and deploying AWS Connect infrastructure. Each stage in the pipeline uses a buildspec file to predefine the commands executed by CodeBuild.

## Buildspec Files Overview

### Purpose

- **Validation & Deployment**: Execute pre-defined commands during CodePipeline execution using CodeBuild.
- **Terraform State Management**: Create and use an S3 bucket for storing the Terraform `tfstate` file.

### Stages

Each stage has its own buildspec file:

---

### 1. **buildspec-validate**

#### Description:

Used for validation and planning of Terraform code.

#### Steps:

1. **Install Required Tools**:

   - Installs Terraform and any other dependencies needed for the validation phase.

2. **Create S3 Bucket**:

   - Creates an S3 bucket to store Terraform state files if it doesn't already exist.

3. **Terraform Validation**:

   - Executes `terraform validate` to ensure the syntax and configuration are correct.

4. **Terraform Plan**:

   - Runs `terraform plan` to create an execution plan and validate resource changes without applying them.

---

### 2. **buildspec-apply**

#### Description:

Used for applying the Terraform configuration to the AWS environment.

#### Steps:

1. **Install Required Tools**:

   - Installs Terraform and any other dependencies needed for the deployment phase.

2. **Apply Terraform Configuration**:

   - Executes `terraform apply` to deploy the validated Terraform configuration to the respective AWS account.
