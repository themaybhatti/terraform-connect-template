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

variable "permissions" {
  type = set(string)
  description = "list of permissions"
}