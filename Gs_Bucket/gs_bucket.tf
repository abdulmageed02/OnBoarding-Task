resource "google_storage_bucket" "gs-bucket" {
  name          = var.bucket_name
  location      = var.region
  storage_class = var.Storage_class
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "binding" {
  bucket = google_storage_bucket.gs-bucket.name
  role = "roles/storage.admin"
  members = ["serviceAccount:${var.SA}"]
}