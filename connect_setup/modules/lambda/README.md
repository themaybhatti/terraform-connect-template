# Connect DevOps Pipeline - Lambda

This Terraform module sets up the necessary infrastructure for deploying an AWS Lambda.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Lambda Function -----
module "lambda_module" {
  source               = "./modules/lambda"
  instance_id          = module.instance.instance_id
  lambda_name          = var.lambda_name
  lambda_role_name     = var.lambda_role_name
  lambda_policy_name   = var.lambda_policy_name
  lambda_function_name = var.lambda_function_name
  lambda_handler       = var.lambda_handler
  lambda_runtime       = var.lambda_runtime
}
```

- This module enables you to easily create an Lambda with the required configuration.
- If any modifications are needed, make sure to update lambda.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Lambda.

- If you require another Lambda, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- Make sure to add the files in the lambda_functions folders.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another Lambda.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
