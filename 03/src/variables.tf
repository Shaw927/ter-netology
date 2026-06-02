###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

### Virtual Machines ###

variable "web_cores" {
  type = number
  description = "How many cores use VM"
}

variable "web_memory" {
  type = number
  description = "How many RAM use VM"
}

variable "preemptible" {
  type = bool
  description = "for economy payment"
}

variable "web_image_id" {
  type = string
  description = "What's the image be used"
}

variable "web_disk_size" {
  type = number
  description = "How many disk size be used"
}

variable "core_fraction" {
  type = number
  description = "core fraction VM"
}

variable "each_vm" {
  type = list(object({
    vm_name = string
    cpu = number
    ram = number
    disk_volume = number
  }))
}

