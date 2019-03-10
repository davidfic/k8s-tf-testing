resource "google_container_cluster" "test" {
  name = "testing"
  region = "us-central1"
  project = "${var.project_id}"

  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "testing_node_pool"
  region     = "us-central1"
  cluster    = "${google_container_cluster.test.name}"
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
