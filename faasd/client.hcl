log_level= "DEBUG"
datacenter = "dc1"
data_dir = "/etc/nomad.d/data"
enable_debug = true

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled = true
  server_join {
    retry_join = ["192.168.56.11"]
  }
}

