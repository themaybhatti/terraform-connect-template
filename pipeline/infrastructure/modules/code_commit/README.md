# Connect DevOps Pipeline - CodeCommit

This Terraform module sets up the necessary infrastructure for deploying a DevOps pipeline and AWS Connect resources, with a focus on using CodeCommit as the source repository. If you prefer a different source control management (SCM) tool, this module is optional.

**_Features:_**

- Creates a CodeCommit repository for storing Terraform files.
- Provides flexibility to replace CodeCommit with any other SCM tool if desired.

**_Prerequisites:_**
Before using this module, ensure that:

- You have a .tfvars file to pass required variable values.

**_Usage:_**

1. Source Repository

- By default, this module is designed for CodeCommit.
- If you opt for CodeCommit:
  - Add the required variables in your .tfvars file to ensure seamless configuration.
  - This module only creates the repository; you must manually push your Terraform code after it is created.

2. Alternate SCM

- If you prefer using another SCM (e.g., GitHub, GitLab, etc.), you can skip this module and directly integrate your chosen SCM with your pipeline.
- Pipeline Configuration: When opting for another SCM, you must modify the pipeline's Terraform code to allow fetching code from the chosen SCM. Ensure these changes align with your SCM provider's configuration requirements.

3. How to use

- Add the following code to your main.tf file to fetch and deploy this module:

```bash
module "codecommit" {
   source = "./modules/code_commit"
   repository_name = var.codecommit_repo_name
   description     = var.codecommit_repo_description
}
```

- Replace the source path with the appropriate module location if necessary.
- Ensure the repository_name and description variables are defined in your .tfvars file or passed as inputs.

**_Notes:_**

- Manual Steps: CodeCommit does not automatically populate with code. After the repository is created, follow the steps in the main README.md file to push your Terraform files.
- Ensure the variables provided in the .tfvars file align with your project requirements.
