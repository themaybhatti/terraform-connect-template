
resource "aws_connect_contact_flow" "connect_flow" {
  instance_id = var.instance_id// Required
  name        = var.name // Required
  description = var.description
  type        = var.type
  filename     = var.filename
  content_hash = filebase64sha256(var.filename)
}