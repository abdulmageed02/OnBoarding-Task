terraform {
  backend "gcs" {
    bucket = "obt-statefile"
    prefix = "terraform/state"
  }
}