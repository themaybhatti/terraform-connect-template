variable "instance_id" {
    type = string
  description = "The ID of the AWS Connect instance"
}

variable "name" {
    type = string
  description = "The name of quick connect"
}

variable "description" {
    type = string
  description = "The description of the quick connects"
}

variable "phone_number" {
  type = string
  description = "Phone number of the quickconnect"
}

variable "config" {
  type = string
  description = "PHONE_NUMBER, QUEUE, USER"
}