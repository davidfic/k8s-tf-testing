output "sa_creds" {
  value = "${base64decode(google_service_account_key.k8s_testing_key.private_key)}"
}
