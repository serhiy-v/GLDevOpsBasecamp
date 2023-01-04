resource "google_compute_instance" "web-server" {
    name         = "web-server"
    machine_type = "e2-micro"
    
    boot_disk {
      initialize_params {
      image = "debian-cloud/debian-11"
        }
    }

    network_interface {
    network = "default"
    
    access_config {
        }
    }

    metadata_startup_script =  file("init.sh")

    tags = [ "http-server" ]
}

resource "google_compute_firewall" "allow-http" {   
    name    = "allow-http"
    network = "default"

    allow {
      protocol  = "tcp"
      ports     = ["80","443"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = [ "http-server" ]
}