// Configure the Google Cloud provider

variable "region" {
  description = "Google Cloud region"
  default = "us-central1"
}

variable "project" {
  description = "Google Cloud Project Name"
  default = "my-project-name"
}

variable "credentials_file" {
  description = "Google Cloud Credentials json file"
  default = "credentials.json"
}

variable "user" {
  description = "The username to create on the remote server"
  default     = "tng"
}
