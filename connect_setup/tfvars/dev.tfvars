identity_management_type         = "CONNECT_MANAGED"
instance_alias                   = "connect-multi-dev"
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
contact_flow_name        = "test-dev" // Required
contact_flow_description = "Test Contact Flow Description"
contact_flow_type        = "CONTACT_FLOW" // Allowed Values are: CONTACT_FLOW, CUSTOMER_QUEUE, CUSTOMER_HOLD, CUSTOMER_WHISPER, AGENT_HOLD, AGENT_WHISPER, OUTBOUND_WHISPER, AGENT_TRANSFER, QUEUE_TRANSFER.
filename                 = "./modules/contact_flow/contact_flow.json"

hours_of_operation_name        = "Monday hours" // Required
hours_of_operation_description = "Office Hours" // Optional
hours_of_operation_time_zone   = "EST"          // Required


queue_name        = " Test-dev"
queue_description = "Testing queue"
// queue_hours_of_operation_id = aws_connect_hours_of_operation.hours_of_operation.id

routing_profile_name        = "Test-dev"         // Required
routing_profile_description = "Test description" // Required

security_profile_name        = "Test-dev"         // Required
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

lambda_name          = "testing-agent-role"
lambda_role_name     = "testing-agent-role"
lambda_policy_name   = "testing-agent-policy"
lambda_function_name = "testing-agent"
lambda_handler       = "agent_status.lambda_handler"
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

agent_status_description = [
  "15 minute breaks (may not be entitled to break so see supervisors for guidance)",
  "30 minute Lunch",
  "Used for restroom if needed between breaks and lunch - must be kept to a minimum",
  "Employees using at the start of their shift (5-7 mins) to open apps and check email.  At the end of shift (2-3 mins ) to avoid getting a call while logging off",
  "Used occasionally to finish data entry (typically no more than 1 min);  agents should perform data entry with caller is on the line and not wait til the end of the call.",
  "To process several requests for same caller.  Must obtain  approval from a supervisor BEFORE using this code",
  "For computer issues, systems, network/internet, applications.  Must notify supervisor immediately to use code so the issue can be logged.",
  "General Meetings (Team Meetings)",
  "Monthly Discuss / Feedback meetings between supervisor and employee",
  "Attending training sessions or receiving training/mentoring from a lead or supervisor",
  "Meeting with HR staff; employee must inform supervisor",
  "Employees with work restrictions (only as directed by supervisors)",
  "Employee discussing with Anastasia",
  "Employee discussing with Elizabeth",
  "Employee discussing with Gladys",
  "Employee discussing with Ryan",
  "Employee discussing with Gerardo",
  "Employee discussing with Alex",
  "Employee discussing with CCO",
  "Employee discussing with Director",
  "Used by the Mentor ONLY - Mentoring agents/new hires.  Agent being mentored should use 'training' or be taking calls.",
  "SCO monitoring and grading agents calls or live monitoring",
  "Handling live chat ONLY.  Not taking regular calls",
  "Working on other assignments (as requested by a supervisor - and supervisor must document the project in agents perf log)",
  "Creating social media content, related work",
  "Monitoring - 'active listening' to 311 social media (to reply and handle SR intake)",
  "Monthly stats",
  "MyLA311 system admin, knowledge base, assisting dept editors/approvers, etc.  To be used by Authorized staff only",
  "Employees reporting CRM 'errors' (articles w/missing info, incorrect #s, etc) to triage the error report",
  "SCO or CIR III ordering or organizing supplies",
  "Processing  unassigned Other SRs in MyLA311 system",
  "Working on data entry or research pertaining to a VM call",
  "Processing 311 emails"
]

agent_status_name = [
  "Breaks",
  "Lunch",
  "Restroom",
  "Log In/Out Prep Time",
  "Data Entry Wrap Up",
  "Multiple SR",
  "Systems Staff PC Related",
  "Meetings",
  "Monthly Discuss / Feedback",
  "Training",
  "Human Resources",
  "Light Duty",
  "Sr CO (A. Williams)",
  "Sr CO (E. Bafield)",
  "Sr CO I (G. Ledezma)",
  "Sr CO I (R. Long)",
  "Sr CO (G  Martinez)",
  "Sr CO (A Reviolotty)",
  "CCO (K. Maranon)",
  "311 Director",
  "Mentoring",
  "Quality Monitoring",
  "Chat",
  "Spec Assignment",
  "Social Content",
  "Social Monitoring",
  "Stats",
  "CRM Admin",
  "SR Listing Errors",
  "Supplies",
  "Unassigned SRs",
  "Voice Mail",
  "Webmaster"
]
