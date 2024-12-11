provider "aws" {
  region = "us-east-1"
}

# ----- Connect Instance -----
module "instance" {
  source                   = "./modules/connect_instance"
  identity_management_type = var.identity_management_type
  inbound_calls_enabled    = var.inbound_calls_enabled
  instance_alias           = var.instance_alias
  outbound_calls_enabled   = var.outbound_calls_enabled

  # Optional
  auto_resolve_best_voices_enabled = var.auto_resolve_best_voices_enabled
  contact_lens_enabled             = var.contact_lens_enabled
  # directory_id                     = var.directory_id
  early_media_enabled            = var.early_media_enabled
  multi_party_conference_enabled = var.multi_party_conference_enabled
  contact_flow_logs_enabled      = var.contact_flow_logs_enabled
}

# ----- Connect - Phone Number -----
module "phone_number" {
  source       = "./modules/phone_number"
  target_arn   = module.instance.instance_arn
  country_code = var.country_code
  type         = var.phone_number_type
  # prefix       = var.phone_number_prefix
  description = var.phone_number_description
}

# ----- Connect - Contact Flow -----
module "contact_flow" {
  source      = "./modules/contact_flow"
  instance_id = module.instance.instance_id
  name        = var.contact_flow_name
  description = var.contact_flow_description
  type        = var.contact_flow_type
  filename    = var.filename
}

# ----- Connect - Hours of Operation -----
module "hours_of_operation" {
  source      = "./modules/hours_of_operation"
  instance_id = module.instance.instance_id
  name        = var.hours_of_operation_name
  description = var.hours_of_operation_description
  time_zone   = var.hours_of_operation_time_zone
}

# ----- Connect - Queues -----
module "queues" {
  source                = "./modules/queue"
  name                  = var.queue_name
  description           = var.queue_description
  hours_of_operation_id = module.hours_of_operation.hours_of_operation_id
  instance_id           = module.instance.instance_id
}

# ----- Connect - Routing Profile -----
module "routing_profile" {
  source                    = "./modules/routing_profile"
  name                      = var.routing_profile_name
  description               = var.routing_profile_description
  instance_id               = module.instance.instance_id
  default_outbound_queue_id = module.queues.queue_id
  queue_id                  = module.queues.queue_id
}

# ----- Connect - Security Profile -----
module "security_profile" {
  source      = "./modules/security_profile"
  name        = var.security_profile_name
  description = var.security_profile_description
  instance_id = module.instance.instance_id
  permissions = var.permissions
}

# ----- Connect - User Management -----
module "user_management" {
  source               = "./modules/users_management"
  instance_id          = module.instance.instance_id
  name                 = var.user_username
  routing_profile_id   = module.routing_profile.routing_profile_id
  security_profile_ids = module.security_profile.security_profile_id
  password             = var.user_password
  email                = var.user_email
  first_name           = var.user_first_name
  last_name            = var.user_last_name
}

# # ----- Connect - Prompt -----
# module "prompt" {
#   source = "./modules/prompt"
#   instance_id = module.instance.instance_id
#   name = var.prompt_name
# }

# ----- Lambda Function -----
module "lambda_module" {
  source               = "./modules/lambda"
  instance_id          = module.instance.instance_id
  lambda_name          = var.lambda_name
  lambda_role_name     = var.lambda_role_name
  lambda_policy_name   = var.lambda_policy_name
  lambda_function_name = var.lambda_function_name
  lambda_handler       = var.lambda_handler
  lambda_runtime       = var.lambda_runtime

}

# ----- Connect - Quick Connect -----
module "quick_connect" {
  source       = "./modules/quick_connect"
  instance_id  = module.instance.instance_id
  config       = var.config
  for_each     = { for idx, description in var.quick_connect_descriptions : idx => description }
  name         = each.value
  description  = each.value
  phone_number = var.phone_numbers[each.key]
}

module "connect_quick_connect_data" {
  source                     = "./modules/data_quick_connects"
  quick_connect_descriptions = var.quick_connect_descriptions
  instance_id                = module.instance.instance_id
}

# ----- Connect - Agent Status -----
resource "null_resource" "create_agent_statuses" {
  count = length(var.agent_status_names)

  provisioner "local-exec" {
    command = <<-EOT
      aws lambda invoke --function-name ${var.lambda_function_name} --cli-binary-format raw-in-base64-out --region us-east-1 --payload '{"InstanceId": "${module.instance.instance_id}", "Value": "${var.agent_status_description[count.index]}", "Name": "${var.agent_status_names[count.index]}"}' response_${var.agent_status_names[count.index]}.json
    EOT
  }

  depends_on = [module.lambda_module]
}
