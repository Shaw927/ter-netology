resource "yandex_compute_instance" "web" {
  count = 2

  name = "web-${count.index + 1}"

  resources {
    cores         = var.web_cores
    memory        = var.web_memory
    core_fraction = var.core_fraction
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  boot_disk {
    initialize_params {
      image_id = var.web_image_id
      size     = var.web_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true

    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
