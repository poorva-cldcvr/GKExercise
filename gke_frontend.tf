resource "google_container_cluster" "primary_frontend" {
  name     = "poorva-frontend"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = "poorva-frontend"
    password = "gZqi#fKhCFlPTRjw"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_frontend_preemptible_nodes" {
  name       = "poorva-frontend-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary_frontend.name
  node_count = 3
  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}


