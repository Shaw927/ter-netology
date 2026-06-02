locals {
  webservers = [
    for vm in yandex_compute_instance.web :
    {
      name              = vm.name
      fqdn              = vm.fqdn
      network_interface = vm.network_interface
    }
  ]

  databases = [
    for vm in yandex_compute_instance.db :
    {
      name              = vm.name
      fqdn              = vm.fqdn
      network_interface = vm.network_interface
    }
  ]

  storage = [
    {
      name              = yandex_compute_instance.storage.name
      fqdn              = yandex_compute_instance.storage.fqdn
      network_interface = yandex_compute_instance.storage.network_interface
    }
  ]
}


resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/hosts.tftpl", {
    webservers = local.webservers
    databases  = local.databases
    storage    = local.storage
  })

  filename = "${path.module}/hosts.ini"
}
