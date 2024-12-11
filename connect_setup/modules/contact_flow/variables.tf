variable "instance_id" {
  type = string
  description = "Specifies the identifier of the hosting Amazon Connect Instance."
}
variable "name" {
  type = string
  description = "Name of the contact flow"
}

variable "description" {
  type = string
  description = "Specifies the description of the Contact Flow."
}

variable "type" {
  type = string
  description = "Allowed Values are: CONTACT_FLOW, CUSTOMER_QUEUE, CUSTOMER_HOLD, CUSTOMER_WHISPER, AGENT_HOLD, AGENT_WHISPER, OUTBOUND_WHISPER, AGENT_TRANSFER, QUEUE_TRANSFER."
}

variable "filename" {
  type = string
  description = "Name of the file"
}