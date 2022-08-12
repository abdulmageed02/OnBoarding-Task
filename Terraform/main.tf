module "Network" {

  source = "./Network"

  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "VM" {

  source = "./VM"

  vm_name         = var.vm_name
  vm_machine_type = var.vm_machine_type
  region          = var.region
  Os_image        = var.Os_image
  sub_id          = module.Network.SUBNET_ID
  SA              = module.VM_SA.SA_email
}

## add 2 another bucket module 
module "Gs_Bucket-1" {

  source = "./Gs_Bucket"

  bucket_name   = "${var.bucket_name}-1"
  Storage_class = var.Storage_class
  region        = var.region
  SA = module.VM_SA.SA_email   
}

module "Gs_Bucket-2" {

  source = "./Gs_Bucket"

  bucket_name   = "${var.bucket_name}-2"
  Storage_class = var.Storage_class
  region        = var.region
  SA = module.VM_SA.SA_email 
}

module "Gs_Bucket-3" {

  source = "./Gs_Bucket"

  bucket_name   = "${var.bucket_name}-3"
  Storage_class = var.Storage_class
  region        = var.region
  SA = module.VM_SA.SA_email 
}


module "GKE" {

  source = "./GKE"

  gke_name                 = var.gke_name
  region                   = var.region
  machine_type             = var.machine_type
  number_of_nodes_per_zone = var.number_of_nodes_per_zone
  master_node_cidr         = var.master_node_cidr
  vpc                      = module.Network.VPC.self_link
  subnet                   = module.Network.SUBNET.self_link
  subnet_cidr              = var.subnet_cidr
  SA                       = module.SA-gcr.SA_email
}


module "BigQ_Dataset-1" {

  source       = "./bigQuery"
  dataset_name = "${var.dataset_name}_a"
  SA           = module.VM_SA.SA_email
}

module "BigQ_Dataset-2" {

  source       = "./bigQuery"
  dataset_name = "${var.dataset_name}_b"
  SA           = module.VM_SA.SA_email
}

module "BigQ_Dataset-3" {

  source       = "./bigQuery"
  dataset_name = "${var.dataset_name}_c"
  SA           = module.VM_SA.SA_email
}

module "SA-gcr" {

  source = "./SA"

  SA_ID   = var.nodepool_sa
  SA_ROLE = var.nodepool_sa_role
}



module "VM_SA" {

  source = "./SA"

  SA_ID   = var.vm_sa
  SA_ROLE = var.vm_sa_role
}

# var the inputs of SA module