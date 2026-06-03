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


variable "ansible_provision" {
  type = bool
  default = true
  description = "Toggle ansible provision"
}

resource "terraform_data" "ansible_apply" {
  count = var.ansible_provision ? 1 : 0

  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.storage,
    local_file.ansible_inventory,
  ]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${abspath(path.module)}/hosts.ini ${abspath(path.module)}/playbook.yml"
    on_failure = continue
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
