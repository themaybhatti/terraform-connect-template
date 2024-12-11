identity_management_type         = "CONNECT_MANAGED"
instance_alias                   = "connect-multi-prod"
inbound_calls_enabled            = true
outbound_calls_enabled           = true
auto_resolve_best_voices_enabled = true
contact_lens_enabled             = true
// directory_id = var.directory_id 
early_media_enabled            = true
multi_party_conference_enabled = false
contact_flow_logs_enabled      = false

// target_arn   = aws_connect_instance.connect_instance.arn 
country_code      = "US"
phone_number_type = "DID"
// prefix       = "+18005" 
phone_number_description = "First phone number"


// instance_id = aws_connect_instance.connect_instance.id // Required
contact_flow_name        = "test-prod" // Required
contact_flow_description = "Test Contact Flow Description"
contact_flow_type        = "CONTACT_FLOW" // Allowed Values are: CONTACT_FLOW, CUSTOMER_QUEUE, CUSTOMER_HOLD, CUSTOMER_WHISPER, AGENT_HOLD, AGENT_WHISPER, OUTBOUND_WHISPER, AGENT_TRANSFER, QUEUE_TRANSFER.
filename                 = "./modules/contact_flow/contact_flow.json"

hours_of_operation_name        = "Monday hours" // Required
hours_of_operation_description = "Office Hours" // Optional
hours_of_operation_time_zone   = "EST"          // Required


queue_name        = " Test-prod"
queue_description = "Testing queue"
// queue_hours_of_operation_id = aws_connect_hours_of_operation.hours_of_operation.id

routing_profile_name        = "Test-prod"        // Required
routing_profile_description = "Test description" // Required

security_profile_name        = "Test-prod"        // Required
security_profile_description = "Test description" // Optional
permissions = [
  "AccessMetrics", "AccessMetrics.AgentActivityAudit.Access"
]


# User management
user_username   = "may-admin"
user_password   = "Mayur@bhatu89"
user_email      = "mayur.bhatti@scalecapacity.com"
user_first_name = "Mayur"
user_last_name  = "Bhatti"

#prompt_name = "test.wav"

lambda_name          = "scip-lambda-role"
lambda_role_name     = "scip-lambda-role"
lambda_policy_name   = "scip-lambda-policy"
lambda_function_name = "assessor_scip_CSAT"
lambda_handler       = "scip_CSAT.lambda_handler"
lambda_runtime       = "python3.9"

config = "PHONE_NUMBER"
quick_connect_names = [
  "311 Main Line"
]
quick_connect_descriptions = [
  "311 Main Line"
]

phone_numbers = [
  "+919408981761"
]
