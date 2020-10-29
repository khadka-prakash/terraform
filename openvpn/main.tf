provider "google" {
 project     = var.project_id
 region      = var.region
 credentials = file("account.json")
}

provider "google-beta" {
  version = "~> 3.5"
  region  = var.region
  credentials = file("account.json")
}

provider "null" {
  version = "~> 2.1"
}

provider "random" {
  version = "~> 2.2"
}

