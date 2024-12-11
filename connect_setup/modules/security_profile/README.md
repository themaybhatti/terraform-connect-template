# Connect DevOps Pipeline - Security Profile

This Terraform module sets up the necessary infrastructure for deploying an Security Profile.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - Security Profile -----
module "security_profile" {
  source      = "./modules/security_profile"
  name        = var.security_profile_name
  description = var.security_profile_description
  instance_id = module.instance.instance_id
  permissions = var.permissions
}
```

- This module enables you to easily create an Security Profile with the required configuration.
- If any modifications are needed, make sure to update both security_profile.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Security Profile.

- If you require another Security Profile, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another Security Profile.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
