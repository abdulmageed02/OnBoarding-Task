resource "google_service_account" "SA" { 
  account_id = var.SA_ID
  display_name = var.SA_ID
}

resource "google_project_iam_member" "SA_BINDING" {
  project = "iti-1-358616"  # should be a variable 
  role    = var.SA_ROLE
  member  = "serviceAccount:${google_service_account.SA.email}"
}


output "SA_email" {
  value = google_service_account.SA.email
}