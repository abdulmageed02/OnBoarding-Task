resource "google_compute_instance" "private-vm"{ 
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = "${var.region}-a"
  boot_disk {
    initialize_params {
      image = var.Os_image
    }
  }

  network_interface {
    subnetwork = var.sub_id

  }
  
  service_account {
    # email  = google_service_account.gs-bucket.email
    email  = var.SA
    scopes = ["cloud-platform"]
    
  }

metadata_startup_script = "${file("/VM/StartupScript.sh")}"
  
}
