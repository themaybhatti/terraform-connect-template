data "aws_connect_quick_connect" "all" {
  for_each = var.quick_connect_descriptions
  instance_id = var.instance_id
  name     = each.value
}