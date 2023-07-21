variable "pm_api_url" {
    type    = string
    description = "The Proxmox Server API URL"
    default = "https://YOUR_URL_OR_IP:8006/api2/json"
}

variable "pm_api_token_id" {
    type    = string
    description = "The Proxmox Terraform User token ID"
    default = "user@realm!user_token"
}

variable "pm_api_token_secret" {
    description = "The Proxmox API token secret"
    type    = string
    default = "API_TOKEN"
}

variable "sshkeys" {
    type    = string
    default = "ssh-rsa key you want to use to connect on your template"
}
