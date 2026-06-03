locals {
  web_vms = [
    for vm in yandex_compute_instance.web :
    {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }
  ]

  db_vms_output = [
    for _, vm in yandex_compute_instance.db :
    {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }
  ]

  all_vms = concat(local.web_vms, local.db_vms_output)
}

output "all_vms" {
  value = local.all_vms
}
