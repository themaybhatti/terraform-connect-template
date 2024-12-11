resource "aws_connect_security_profile" "security_profile" {
  instance_id = var.instance_id // Required
  name        = var.name // Required
  description = var.description // Optional
  permissions = var.permissions

}