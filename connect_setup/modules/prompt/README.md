# Connect DevOps Pipeline - Queue

This Terraform module sets up the necessary infrastructure for deploying an Queue.

---

## Prerequisites

Before using this module, ensure that:

- A `.tfvars` file is prepared with the required variable values.

---

## Usage

### 1. How to Use:

- Add the following code to your `main.tf` file to fetch and deploy this module:

```bash
resource "aws_connect_queue" "queue" {
  instance_id           = var.instance_id           // Required
  name                  = var.name                  // Required
  description           = var.description           // Optional
  hours_of_operation_id = var.hours_of_operation_id // Required
  # quick_connect_ids     = var.quick_connect_ids     // Optional
  # status                = var.status
  # max_contacts          = var.max_contacts
}
```

- This module enables you to fetch already created Queue.
- If any modifications are needed, make sure to update queue.tf and main.tf.
- Replace the source path with the appropriate module location if necessary.
- Ensure the variables are defined in your .tfvars file or passed as inputs.

### 2. Additional Queue.

- If you require another Queue, simply duplicate the code above and add the necessary variables in variable.tf and the .tfvars file.
- No changes are required in this module itself—just by adding the additional module in main.tf, you can deploy another Queue.

## Notes

- **Manual Steps**: Ensure that the variables in the `.tfvars` file are correctly aligned with your project requirements to avoid configuration issues.
