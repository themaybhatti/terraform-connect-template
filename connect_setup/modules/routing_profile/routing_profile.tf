resource "aws_connect_routing_profile" "routing_profile" {
  instance_id               = var.instance_id // Required
  name                      = var.name// Required
  default_outbound_queue_id = var.default_outbound_queue_id // Required
  description               = var.description // Required

  media_concurrencies {
    channel     = "VOICE"
    concurrency = 1
  } 
  media_concurrencies {
  channel     = "CHAT"
  concurrency = 1
  }
  media_concurrencies {
  channel     = "TASK"
  concurrency = 1
  }
  // Required

  queue_configs {
    channel  = "VOICE"
    delay    = 0
    priority = 1
    queue_id = var.queue_id
  }
  queue_configs {
    channel  = "CHAT"
    delay    = 0
    priority = 2
    queue_id = var.queue_id
  }
  queue_configs {
    channel  = "TASK"
    delay    = 0
    priority = 3
    queue_id = var.queue_id
  } /*
  (Optional) One or more queue_configs blocks that specify the inbound queues associated with the routing profile. 
  If no queue is added, the agent only can make outbound calls.
*/
}