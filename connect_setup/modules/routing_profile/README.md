# Connect DevOps Pipeline - Routing Profile

This Terraform module sets up the necessary infrastructure for deploying an Routing Profile.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
# ----- Connect - Routing Profile -----
module "routing_profile" {
  source                    = "./modules/routing_profile"
  name                      = var.routing_profile_name
  description               = var.routing_profile_description
  instance_id               = module.instance.instance_id
  default_outbound_queue_id = module.queues.queue_id
  queue_id                  = module.queues.queue_id
}
```

- This module enables you to easily create an Routing Profile with the required configuration.
- If any modifications are needed, make sure to update both routing_profile.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Routing Profile.

- If you require another Routing Profile, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another Routing Profile.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
