# Connect DevOps Pipeline - User Management

This Terraform module sets up the necessary infrastructure for deploying an User Management.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - User Management -----
module "user_management" {
  source               = "./modules/users_management"
  instance_id          = module.instance.instance_id
  name                 = var.user_username
  routing_profile_id   = module.routing_profile.routing_profile_id
  security_profile_ids = module.security_profile.security_profile_id
  password             = var.user_password
  email                = var.user_email
  first_name           = var.user_first_name
  last_name            = var.user_last_name
}
```

- This module enables you to easily create an User Management with the required configuration.
- If any modifications are needed, make sure to update both user.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional User Management.

- If you require another User Management, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another User Management.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
