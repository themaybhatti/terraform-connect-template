resource "aws_connect_queue" "queue" {
  instance_id           = var.instance_id           // Required
  name                  = var.name                  // Required
  description           = var.description           // Optional
  hours_of_operation_id = var.hours_of_operation_id // Required
  # quick_connect_ids     = var.quick_connect_ids     // Optional
  # status                = var.status
  # max_contacts          = var.max_contacts
}
