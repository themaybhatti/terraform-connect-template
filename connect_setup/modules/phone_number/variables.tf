variable "target_arn" {
  type = string
  description = "The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to."
}

variable "country_code" {
  type = string
  description = " The ISO country code"
}

variable "type" {
  type = string
  default = "he type of phone number. Valid Values: TOLL_FREE | DID"
}

# variable "prefix" {
#   type = string
#   description = "The prefix of the phone number that is used to filter available phone numbers. If provided, it must contain + as part of the country code. Do not specify this argument when importing the resource"
# }

variable "description" {
  type = string
  description = "The description of the phone number."
}