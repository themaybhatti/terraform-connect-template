variable "instance_id" {
    type = string
  description = "The ID of the AWS Connect instance"
}

variable "name" {
    type = string
  description = "The name of the hours of operation"
}

variable "description" {
    type = string
  description = "The description of the hours of operation"
}

variable "hours_of_operation_id" {
  type = string
  description = "Id of the hours of operation"
}

# variable "quick_connect_ids" {
#   description = "List of quick connect IDs"
#   type        = list(string)
# }

# variable "outbound_caller_config" {
#   description = "Configuration for outbound caller settings"
#   type = object({
#     outbound_caller_id_name      = string
#     outbound_caller_id_number_id = string
#     outbound_flow_id             = string
#   })
# }

# variable "status" {
#   type = string
#   description = "Staus of the queues ENABLED | DISBALED"
# }

# variable "max_contacts" {
#   type = number
#   description = "Specifies the maximum number of contacts that can be in the queue before it is considered full. Minimum value of 0"
# }