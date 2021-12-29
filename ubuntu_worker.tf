resource "google_compute_instance" "worker" {
  name         = "lf260worker"
  machine_type = "e2-medium"
  zone         = "${var.region}-b"
  tags = ["hostname", "worker", "k8s", "lf260"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.k8s-nodes.id


    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
    ssh-keys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = "${file("lf260secondary.sh")}"

}

