output "quick_connect_ids" {
  value = [for qc in data.aws_connect_quick_connect.all : qc.quick_connect_id]
}
