job "cows" {
  datacenters = ["dc1"]

  group "cache" {
    network {
      port "cows" {
        static = 8080
      }
    }

    task "cows" {
      driver = "docker"

      config {
        image = "ghcr.io/openfaas/cows:latest"
        ports = ["cows"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
