# Connect DevOps Pipeline - Contact Flows

This Terraform module sets up the necessary infrastructure for deploying an AWS Connect flows.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - Contact Flow -----
module "contact_flow" {
  source      = "./modules/contact_flow"
  instance_id = module.instance.instance_id
  name        = var.contact_flow_name
  description = var.contact_flow_description
  type        = var.contact_flow_type
  filename    = var.filename
}
```

- This module enables you to easily create an contact flow in the connect instance with the required configuration.
- Just add your exported JSON in the contact_flow.json file.
- If any modifications are needed, make sure to update both contact_flow.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional flow.

- If you require another flow, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another flow.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
