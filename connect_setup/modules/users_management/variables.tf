variable "instance_id" {
  type        = string
  description = "ID of the connect-instance"
}
variable "name" {
  type        = string
  description = "Name of the routing profile."
}
variable "routing_profile_id" {
  type        = string
  description = "ID of the routing profiles."
}
variable "security_profile_ids" {
  type        = string
  description = "List of the security profiles."
}
# variable "phone_type" {
#   type        = string
#   description = "User - Phone type"
# }
variable "password" {
  type        = string
  description = "Password of the user"
}
variable "email" {
  type        = string
  description = "Email of the user"
}
variable "first_name" {
  type        = string
  description = "first name of the user"
}
variable "last_name" {
  type        = string
  description = "last name of the user"
}