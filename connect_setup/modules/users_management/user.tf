# User Creation
resource "aws_connect_user" "user" {
  instance_id          = var.instance_id
  name                 = var.name
  routing_profile_id   = var.routing_profile_id
  security_profile_ids = [var.security_profile_ids]
  phone_config {
    after_contact_work_time_limit = 0 //Optional
    phone_type                    = "SOFT_PHONE"
    # auto_accept = false //Optional
    # desk_phone_number = "+112345678912" //Optional (Required if phone_type is set as DESK_PHONE)
  }
  // Optional Arguments
  # hierarchy_group_id = var.hierarchy_group_ids
  password = var.password
  identity_info {
    email      = var.email //Optional
    first_name = var.first_name                  //Optional
    last_name  = var.last_name             //Optional
  }
  # tags = {
  #   "Name" = "Username"
  # } 
}