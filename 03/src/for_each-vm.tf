locals {
  db_vms = {
    for vm in var.each_vm :
    vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db" {
  for_each = local.db_vms

  name = each.value.vm_name

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = var.web_image_id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
