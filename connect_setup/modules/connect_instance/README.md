# Connect DevOps Pipeline - Connect Instance

This Terraform module sets up the necessary infrastructure for deploying an AWS Connect Instance.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect Instance -----
module "instance" {
  source                   = "./modules/connect_instance"
  identity_management_type = var.identity_management_type
  inbound_calls_enabled    = var.inbound_calls_enabled
  instance_alias           = var.instance_alias
  outbound_calls_enabled   = var.outbound_calls_enabled

  # Optional
  auto_resolve_best_voices_enabled = var.auto_resolve_best_voices_enabled
  contact_lens_enabled             = var.contact_lens_enabled
  # directory_id                     = var.directory_id
  early_media_enabled            = var.early_media_enabled
  multi_party_conference_enabled = var.multi_party_conference_enabled
  contact_flow_logs_enabled      = var.contact_flow_logs_enabled
}
```

- This module enables you to easily create an AWS Connect instance with the required configuration.
- If any modifications are needed, make sure to update both instance.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Instance.

- If you require another instance, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another instance.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
