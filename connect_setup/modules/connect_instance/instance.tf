resource "aws_connect_instance" "connect_instance" {
  identity_management_type = var.identity_management_type //Required
  inbound_calls_enabled    = var.inbound_calls_enabled    //Required
  instance_alias           = var.instance_alias           // Optional
  outbound_calls_enabled   = var.outbound_calls_enabled   //Required

  # Optional
  auto_resolve_best_voices_enabled = var.auto_resolve_best_voices_enabled // by default its true
  contact_flow_logs_enabled        = var.contact_flow_logs_enabled        // by default its false
  contact_lens_enabled             = var.contact_lens_enabled             // by default its true
  # directory_id                     = var.directory_id
  early_media_enabled            = var.early_media_enabled            // by default its true if outbound calls is enabled
  multi_party_conference_enabled = var.multi_party_conference_enabled // by default its false
}
