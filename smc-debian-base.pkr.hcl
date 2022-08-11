# bakery reciepe to ensure a fully deployable Debian
# base golden image
source "googlecompute" "debian-base" {
  project_id              = "simplifymycloud-dev"
  source_image_family     = "debian-11"
  ssh_username            = "packer"
  use_os_login            = true
  zone                    = "us-west1-c"
  subnetwork              = "smc-dev-subnet-01"
  image_name              = "debian-base"
  image_description       = "Debian 11 golden image v.1.0"
  image_storage_locations = ["us-west1"]
}

build {
  sources = ["sources.googlecompute.debian-base"]
  provisioner "shell" {
    scripts = [
      "sudo apt-get update -y",
      "sudo apt-get install unzip -y",
      "sudo apt-get install wget -y",
      "sudo apt-get install git -y",
    ]
  }
}