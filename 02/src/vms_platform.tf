###vm web vars

variable "vm_web_name" {
  type = string
  default = "netology-develop-platform-web"
  description = "Название виртуальной машины"
}

variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "версия ОС"
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
  description = "Тип процессора"
}

#variable "vm_web_cores" {
#  type = number
#  default = 2
#  description = "Количество выделенных ядер процеесора"
#}
#
#variable "vm_web_memory" {
#  type = number
#  default = 2
#  description = "Количество выделенной оперативной памяти"
#}
#
#variable "vm_web_core_fraction" {
#  type = number
#  default = 5
#  description = "Гарантированная доля процессора которая будет предоставлена"
#}

variable "vm_web_preemptible" {
  type = bool
  default = true
  description = "в любой момент могут остановить или выключить машину, для тестовых машин подходит"
}

variable "vm_web_nat" {
  type = bool
  default = true
  description = "нужен для того что бы машина получила адрес  который доступен в интернете а не только внутренний"
}

#variable "vm_web_serial_port" {
#  type = number
#  default = 1
#  description = "Включение серийной косоли"
#}

###vm db vars

variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
  description = "Название виртуальной машины"
}

variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "версия ОС"
}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v1"
  description = "Тип процессора"
}

#variable "vm_db_cores" {
#  type = number
#  default = 2
#  description = "Количество выделенных ядер процеесора"
#}
#
#variable "vm_db_memory" {
#  type = number
#  default = 2
#  description = "Количество выделенной оперативной памяти"
#}
#
#variable "vm_db_core_fraction" {
#  type = number
#  default = 20
#  description = "Гарантированная доля процессора которая будет предоставлена"
#}

variable "vm_db_preemptible" {
  type = bool
  default = true
  description = "в любой момент могут остановить или выключить машину, для тестовых машин подходит"
}

variable "vm_db_nat" {
  type = bool
  default = true
  description = "нужен для того что бы машина получила адрес  который доступен в интернете а не только внутренний"
}

#variable "vm_db_serial_port" {
#  type = number
#  default = 1
#  description = "Включение серийной косоли"
#}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона для db"
}

variable "vpc_name_db" {
  type = string
  default = "develop-db"
  description = "название подсети"
}

variable "db_cidr" {
  type = list(string)
  default = ["10.0.2.0/24"]
  description = "подсеть отличная от нашей дефолтной"
}

variable "env" {
  type    = string
  default = "develop"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "Метадата для ВМ"
  type        = map(any)
}
