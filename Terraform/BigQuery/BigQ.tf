resource "google_bigquery_dataset" "dataset" {
 dataset_id                  = var.dataset_name 
   access {
    role          = "WRITER"  # should be a variable
    user_by_email = var.SA
  }
}