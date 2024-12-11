# Connect DevOps Pipeline - Phone Number

This Terraform module sets up the necessary infrastructure for deploying an AWS Phone Number.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - Phone Number -----
module "phone_number" {
  source       = "./modules/phone_number"
  target_arn   = module.instance.instance_arn
  country_code = var.country_code
  type         = var.phone_number_type
  # prefix       = var.phone_number_prefix
  description = var.phone_number_description
}

```

- This module enables you to easily issue an Phone Number with the required configuration.
- Using terraform max 5 Phone number can be issued.
- If any modifications are needed, make sure to update phone_number.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Phone Number.

- If you require another Phone Number, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another Phone Number.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
