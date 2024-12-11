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
variable "default_outbound_queue_id" {
    type = string
  description = "The default outbound queue id"
}

variable "queue_id" {
  type = string
  description = "The queue id"
}