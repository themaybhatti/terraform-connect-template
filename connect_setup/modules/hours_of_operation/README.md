# Connect DevOps Pipeline - Hours of Operation

This Terraform module sets up the necessary infrastructure for deploying an AWS Hours of Operation.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - Hours of Operation -----
module "hours_of_operation" {
  source      = "./modules/hours_of_operation"
  instance_id = module.instance.instance_id
  name        = var.hours_of_operation_name
  description = var.hours_of_operation_description
  time_zone   = var.hours_of_operation_time_zone
}

```

- This module enables you to easily create an Hours of Operation with the required configuration.
- If any modifications are needed, make sure to update hours_of_operation.
- Currently we have hard coded the timings for it.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional operations.

- If you require another operations, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another operations.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
