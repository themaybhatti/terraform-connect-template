resource "aws_connect_quick_connect" "quick_connect" {
  instance_id = var.instance_id
  name        = var.name
  description = var.description

  quick_connect_config {
    quick_connect_type = var.config
    phone_config {
      phone_number = var.phone_number
    }
  }
}