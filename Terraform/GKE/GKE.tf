resource "google_container_cluster" "GKE" {
  name     = var.gke_name
  location = "${var.region}-c"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc

  subnetwork               = var.subnet

  node_locations = [
    # "${var.region}-c",
    "${var.region}-f"
  ]
    master_authorized_networks_config {
        
        cidr_blocks{
            cidr_block = var.subnet_cidr
            
            display_name = "my-subnet"
        }

    }
    ip_allocation_policy {
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_node_cidr
  }
}

resource "google_container_node_pool" "nodePool" {
  name       = "${var.gke_name}-pool"
  location   = "${var.region}-c"
  cluster    = google_container_cluster.GKE.name
  node_count = var.number_of_nodes_per_zone

  # autoscaling {
  #   min_node_count = "4"
  #   max_node_count = "4"
  # }


  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    # service_account = google_service_account.node-acc.email
    service_account = var.SA
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}



