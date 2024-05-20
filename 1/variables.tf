variable "service_account_key_file" {
  description = "Path to Yandex SA .json keyfile"
  type = string
}

variable "yandex_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "yandex_folder_id" {
  description = "Yandex Folder ID"
  type        = string
}

variable "vm_id" {
  description = "Unique VM id"
  type        = string
  default     = "1"
}

variable "subnet_id" {
  description = "Subnetwork ID"
  type = string
}

variable "network_id" {
  description = "Network ID"
  type = string
}

variable "target_group_id" {
  description = "Target group ID"
  type = string
}

variable "nlb_id" {
  description = "Network Load Balancer ID"
  type = string
}

variable "ssh_key" {
  description = "Public ssh-key for accessing VM by var.username"
  type = string
}

variable "zone" {
  description = "Access zone"
  type = string
  default = "ru-central1-a"
}

variable "aws_access_key" {
  description = "SA static public key for accessing S3"
  type = string
  default = ""
}

variable "aws_secret_key" {
  description = "SA static private key for accessing S3"
  type = string
  default = ""
}
