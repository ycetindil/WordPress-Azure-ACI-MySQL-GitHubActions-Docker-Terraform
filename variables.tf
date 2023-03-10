variable "prefix" {
  default = "wordpress"
}

# Resource group
variable "location" {
  default = "eastus"
}

# MySQL Flexible Database
variable "db_server_name" {
  description = "Should be unique and match with the Dockerfile"
  default     = "ycetindil-wordpress"
}

variable "db_username" {
  description = "Should match with the Dockerfile"
  default     = "ycetindil"
}

variable "db_password" {
  description = "Should match with the Dockerfile"
  default     = "Password1234"
}

# Container Instance
variable "docker_hub_username" {
  default = "ycetindil"
}