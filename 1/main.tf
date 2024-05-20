terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id  = var.yandex_cloud_id
  folder_id = var.yandex_folder_id
  zone = var.zone
}

resource "yandex_compute_instance" "vm" {
  name        = "guestbook-vm-${var.vm_id}"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd8idq8k33m9hlj0huli"
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${templatefile("./cloud-init.yaml", {ssh_key = var.ssh_key, aws_access_key = var.aws_access_key, aws_secret_key = var.aws_secret_key, zone = var.zone})}"
  }

  scheduling_policy {
    preemptible = false
  }
}

output "instance_ip_address" {
  value = yandex_compute_instance.vm.*.network_interface.0.ip_address
}

output "subnet_id" {
  value = yandex_compute_instance.vm.*.network_interface.0.subnet_id
}
