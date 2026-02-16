terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.12.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {}

#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}


resource "docker_image" "nginx" {   #тут надо было написать что за имедж именно
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" { # Тут было не верное имя, потому что начиналось с цифры, а это нельзя
  image = docker_image.nginx.image_id
  name  = "hello_world" # тут был FAKE в конце ресурса, то есть такого ресурса нет и атрибут result был написан неправильно

  ports {
    internal = 80
    external = 9090
  }
}

