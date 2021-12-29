data "template_file" "lf260primary" {
  template = file("lf260primary.sh")
  vars = {
    USER         = "${var.user}"
  }
}



resource "google_compute_instance" "primary" {
  name         = "lf260primary"
  machine_type = "e2-medium"
  zone         = "${var.region}-b"
  tags = ["hostname", "controlplane", "k8s", "lf260"]

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

  metadata_startup_script = data.template_file.lf260primary.rendered

}

// A variable for extracting the external IP address of the instance
output "primaryip" {
 value = google_compute_instance.primary.network_interface.0.access_config.0.nat_ip
}
// A variable for extracting the external IP address of the instance
output "workerip" {
 value = google_compute_instance.worker.network_interface.0.access_config.0.nat_ip
}
