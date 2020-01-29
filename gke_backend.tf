provider "google" {
  project = "cloudcover-sandbox"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_container_cluster" "primary" {
  name     = "poorva-backend"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 3

  master_auth {
    username = "poorva-backend"
    password = "gZqi#fKhCFlPTRjw"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "poorva-backend-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1
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


