resource "aws_connect_hours_of_operation" "hours_of_operation" {
  instance_id = var.instance_id // Required
  name        = var.name // Required
  description = var.description// Optional
  time_zone   = var.time_zone // Required
  config {
    day = "MONDAY"

    end_time {
      hours   = 19
      minutes = 0
    }

    start_time {
      hours   = 7
      minutes = 0
    }
  } 
  config {
    day = "TUESDAY"

    end_time {
      hours   = 19
      minutes = 0
    }

    start_time {
      hours   = 7
      minutes = 0
    }
  }
  config {
    day = "WEDNESDAY"

    end_time {
      hours   = 19
      minutes = 0
    }

    start_time {
      hours   = 7
      minutes = 0
    }
  }
  config {
    day = "THURSDAY"

    end_time {
      hours   = 19
      minutes = 0
    }

    start_time {
      hours   = 7
      minutes = 0
    }
  }
  config {
    day = "FRIDAY"

    end_time {
      hours   = 19
      minutes = 0
    }

    start_time {
      hours   = 7
      minutes = 0
    }
  }
  config {
    day = "SATURDAY"

    end_time {
      hours   = 16
      minutes = 45
    }

    start_time {
      hours   = 8
      minutes = 0
    }
  }
  config {
    day = "SUNDAY"

    end_time {
      hours   = 16
      minutes = 45
    }

    start_time {
      hours   = 8
      minutes = 0
    }
  }
}