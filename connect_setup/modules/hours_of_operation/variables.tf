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

variable "time_zone" {
    type = string
  description = "The time zone for the hours of operation"
}

# variable "config" {
#   description = "The hours of operation configuration"
#   type        = list(object({
#     day       = string
#     start_time = object({
#       hours   = number
#       minutes = number
#     })
#     end_time   = object({
#       hours   = number
#       minutes = number
#     })
#   }))
# }

# variable "config1" {
#   description = "The hours of operation configuration"
#   type        = list(object({
#     day       = string
#     start_time = object({
#       hours   = number
#       minutes = number
#     })
#     end_time   = object({
#       hours   = number
#       minutes = number
#     })
#   }))
# }

