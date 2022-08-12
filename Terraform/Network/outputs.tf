output "VPC_ID" {
  value       = google_compute_network.vpc_network.id
}
output "VPC" {
  value       = google_compute_network.vpc_network
}

output "SUBNET_ID" {
  value       = google_compute_subnetwork.my_subnet.id
}
output "SUBNET" {
  value       = google_compute_subnetwork.my_subnet 
}