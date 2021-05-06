provider "scaleway" {
  access_key = var.access_key
  secret_key = var.secret_key
  project_id = var.project_id
  zone = var.zone
  region = var.region
}
