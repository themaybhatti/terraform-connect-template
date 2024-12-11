variable "identity_management_type" {
  type = string
  description = "identity management type attached to the instance."
}

variable "inbound_calls_enabled" {
    type = bool
    description = "Specifies whether inbound calls are enabled"
  
}

variable "instance_alias" {
  type = string
  description = "Specifies the name of the instance"
}

variable "outbound_calls_enabled" {
    type = bool
    description = "Specifies whether outbound calls are enabled"
  
}

variable "auto_resolve_best_voices_enabled" {
    type = bool
    description = "Specifies whether auto resolve best voices is enabled. Defaults to true."
    default = true
  
}

variable "contact_flow_logs_enabled" {
    type = bool
    description = "Specifies whether contact flow logs are enabled."
    default = false
  
}

variable "contact_lens_enabled" {
    type = bool
    description = " Specifies whether contact lens is enabled."
    default = true
  
}

# variable "directory_id" {
#     type = string
#     description = "he identifier for the directory if identity_management_type is"
  
# }


variable "early_media_enabled" {
    type = bool
    description = " Specifies whether early media for outbound calls is enabled "
    default = true
  
}

variable "multi_party_conference_enabled" {
    type = bool
    description = " Specifies whether multi-party calls/conference is enabled"
    default = false
  
}