# Connect DevOps Pipeline - Quick Connect

This Terraform module sets up the necessary infrastructure for deploying an AWS Quick Connect.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
module "connect_quick_connect_data" {
  source                     = "./modules/data_quick_connects"
  quick_connect_descriptions = var.quick_connect_descriptions
  instance_id                = module.instance.instance_id
}
```

- This module enables you to easily fetch the an Quick Connect with the required configuration.
- If any modifications are needed, make sure to update both data_quick_connect.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional quick connect.

- If you require another quick connect, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another quick connect.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
