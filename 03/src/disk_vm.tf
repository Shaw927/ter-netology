resource "yandex_compute_disk" "storage_disk" {
  count = 3

  name = "storage-disk-${count.index + 1}"
  size = 1
  type = "network-hdd"

  zone = var.default_zone
}

resource "yandex_compute_instance" "storage" {
  name = "storage"

  resources {
    cores = 2
    memory = 2
    core_fraction = var.core_fraction
}

  boot_disk {
    initialize_params {
      image_id = var.web_image_id
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk

    content {
      disk_id = secondary_disk.value.id
      auto_delete = true
    }
  }  
}
