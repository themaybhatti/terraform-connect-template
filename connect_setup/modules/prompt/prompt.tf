data "aws_connect_prompt" "prompt" {
  instance_id = var.instance_id
  name        = var.name
}