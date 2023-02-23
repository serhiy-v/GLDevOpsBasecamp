resource "google_compute_instance" "k8s-wordpress" {
  name         = "k8s-wordpress"
  machine_type = "custom-4-8192"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 35
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vpc_subnet.self_link
    network = google_compute_network.vpc.self_link

    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  tags = ["allow-http", "allow-ssh"]
}

resource "null_resource" "hardening" {
    provisioner "remote-exec" {
    inline = ["echo 'Wait until instance will be ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host        = google_compute_instance.k8s-wordpress.network_interface[0].access_config[0].nat_ip
    }
  }

   provisioner "local-exec" {
    command = "cd ..; cd ansible;ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook hardening-playbook.yaml -i hosts -e host=${google_compute_instance.k8s-wordpress.network_interface[0].access_config[0].nat_ip}"
  }

  depends_on = [google_compute_instance.k8s-wordpress]
}
