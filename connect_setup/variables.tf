# --------- Connect Instance Variables ---------

variable "identity_management_type" {
  type        = string
  description = "identity management type attached to the instance."
}

variable "inbound_calls_enabled" {
  type        = bool
  description = "Specifies whether inbound calls are enabled"
}

variable "instance_alias" {
  type        = string
  description = "Specifies the name of the instance"
}

variable "outbound_calls_enabled" {
  type        = bool
  description = "Specifies whether outbound calls are enabled"

}

variable "auto_resolve_best_voices_enabled" {
  type        = bool
  description = "Specifies whether auto resolve best voices is enabled. Defaults to true."
  default     = true
}

variable "contact_lens_enabled" {
  type        = bool
  description = " Specifies whether contact lens is enabled."
  default     = true

}

# variable "directory_id" {
#   type        = string
#   description = "he identifier for the directory if identity_management_type is"
# }

variable "early_media_enabled" {
  type        = bool
  description = " Specifies whether early media for outbound calls is enabled "
  default     = true
}

variable "multi_party_conference_enabled" {
  type        = bool
  description = " Specifies whether multi-party calls/conference is enabled"
  default     = false
}

variable "contact_flow_logs_enabled" {
  type        = bool
  description = "Specifies whether contact flow logs are enabled."
  default     = false
}

# phone number variables

# variable "target_arn" {
#   type = string
#   description = "The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to."
# }

variable "country_code" {
  type        = string
  description = " The ISO country code"
}

variable "phone_number_type" {
  type    = string
  default = "he type of phone number. Valid Values: TOLL_FREE | DID"
}

# variable "phone_number_prefix" {
#   type = string
#   description = "The prefix of the phone number that is used to filter available phone numbers. If provided, it must contain + as part of the country code. Do not specify this argument when importing the resource"
# }

variable "phone_number_description" {
  type        = string
  description = "The description of the phone number."
}

# contact flow variables

# variable "instance_id" {
#   type = string
#   description = "Specifies the identifier of the hosting Amazon Connect Instance."
# }
variable "contact_flow_name" {
  type        = string
  description = "Name of the contact flow"
}

variable "contact_flow_description" {
  type        = string
  description = "Specifies the description of the Contact Flow."
}

variable "contact_flow_type" {
  type        = string
  description = "Allowed Values are: CONTACT_FLOW, CUSTOMER_QUEUE, CUSTOMER_HOLD, CUSTOMER_WHISPER, AGENT_HOLD, AGENT_WHISPER, OUTBOUND_WHISPER, AGENT_TRANSFER, QUEUE_TRANSFER."
}

variable "filename" {
  type        = string
  description = "Name of the file"
}


# hours of operation variables

# variable "instance_id" {
#   description = "The ID of the AWS Connect instance"
# }

variable "hours_of_operation_name" {
  description = "The name of the hours of operation"
}

variable "hours_of_operation_description" {
  description = "The description of the hours of operation"
}

variable "hours_of_operation_time_zone" {
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

# Queue variables

# variable "instance_id" {
#     type = string
#   description = "The ID of the AWS Connect instance"
# }

variable "queue_name" {
  type        = string
  description = "The name of the hours of operation"
}

variable "queue_description" {
  type        = string
  description = "The description of the hours of operation"
}

# variable "queue_hours_of_operation_id" {
#   type = string
#   description = "Id of the hours of operation"
# }

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

#routing profiles variables

variable "routing_profile_name" {
  type        = string
  description = "The name of the hours of operation"
}

variable "routing_profile_description" {
  type        = string
  description = "The description of the hours of operation"
}

#security profile Variables

variable "security_profile_name" {
  type        = string
  description = "The name of the hours of operation"
}

variable "security_profile_description" {
  type        = string
  description = "The description of the hours of operation"
}

variable "permissions" {
  type        = set(string)
  description = "list of permissions"
}

# User management
variable "user_username" {
  type        = string
  description = "Name of the User"
}

variable "user_password" {
  type        = string
  description = "Password of the user"
}
variable "user_email" {
  type        = string
  description = "Email of the user"
}
variable "user_first_name" {
  type        = string
  description = "first name of the user"
}
variable "user_last_name" {
  type        = string
  description = "last name of the user"
}

#Prompt Varibale

# variable "prompt_name" {
#     type = string
#   description = "The name of the hours of operation"
# }

# lambda variable

variable "lambda_name" {
  type        = string
  description = "The lambda resource name"
}

variable "lambda_policy_name" {
  type        = string
  description = "The lambda policy name"
}

variable "lambda_function_name" {
  type        = string
  description = "The lambda function name"
}

variable "lambda_handler" {
  type        = string
  description = "The lambda handler"
}

variable "lambda_role_name" {
  type        = string
  description = "The lambda role name"
}

variable "lambda_runtime" {
  type        = string
  description = "The lambda runtime"
}

# Quick Connect variables

variable "quick_connect_names" {
  type        = set(string)
  description = "The name of the Quick Connects"
}

variable "quick_connect_descriptions" {
  type        = list(string)
  description = "The description of the Quick Connects"
}

variable "phone_numbers" {
  type        = list(string)
  description = "Phone number of the quickconnect"
}

variable "config" {
  type        = string
  description = "PHONE_NUMBER, QUEUE, USER"
}

# Agent status variables

variable "agent_status_names" {
  type        = list(string)
  description = "Name of the Agent status"
}

variable "agent_status_description" {
  type        = list(string)
  description = "Description of the Agent status"
}
