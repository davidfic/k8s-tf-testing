resource "google_service_account" "k8s_testing" {
  account_id = "${var.account_id}"
  display_name = "k8s_testing"
  project = "${var.project_id}"
}

resource "google_service_account_key" "k8s_testing_key" {
  service_account_id = "${google_service_account.k8s_testing.name}"
  public_key_type = "TYPE_X509_PEM_FILE"
}

